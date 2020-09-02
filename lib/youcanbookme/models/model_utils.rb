# frozen_string_literal: true

require 'time'

module YouCanBookMe
  # YouCanBook.me model utility.
  module ModelUtils
    # @param [Hash] attrs the attributes of the model.
    # @param [YouCanBookMe::Client] the api client.
    def initialize(attrs = nil, client = nil)
      @client = client
      set_attributes attrs
    end

    def inspect
      "\#<#{self.class}:#{object_id}>"
    end

    module ClassMethods
      # @param [String] prefix
      # @return [Array<String>]
      def fields(prefix = nil)
        instance = new
        ret_fields = []
        instance.methods.each do |m|
          next if %i[=== == !=].include? m
          next unless m.to_s.end_with? '='

          field = m.to_s.split('=')[0]
          ret_fields << (prefix ? "#{prefix}.#{field}" : field)
        end
        ret_fields
      end

      # @param [String] prefix
      # @param [Integer] max_depth
      # @return [Array<String>]
      def deep_fields(prefix = nil, max_depth: 3)
        ret_fields = []
        fields(prefix).each do |field_with_prefix|
          ret_fields << field_with_prefix
          depth = field_with_prefix.split('.').length
          field = field_with_prefix.split('.')[-1].to_sym
          next unless defined? self::ASSOCIATION
          next unless self::ASSOCIATION.key? field

          child_klass = self::ASSOCIATION[field]
          child_fields = if (self == child_klass) || depth >= max_depth
                           c_klass.fields(field_with_prefix)
                         else
                           c_klass.deep_fields(field_with_prefix, max_depth: max_depth)
                     end
          child_fields.each { |c_field| ret_fields << c_field }
        end
        ret_fields
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end

    private

    def set_attributes(attrs)
      return if attrs.nil?
      return unless attrs.is_a? Hash
      return if attrs.empty?

      attrs.each do |key, value|
        next unless respond_to? "#{key}=".to_sym

        if defined?(self.class::ASSOCIATION) && self.class::ASSOCIATION.key?(key)
          klass = self.class::ASSOCIATION[key]
          if value.is_a? Array
            value = value.map { |item| klass.new item, @client }
          elsif value.is_a? Hash
            value = klass.new value, @client
          end
        end
        instance_variable_set "@#{key}", value
      end
      after_set_attributes(attrs)
    end

    def after_set_attributes(attrs); end
  end
end
