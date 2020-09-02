# frozen_string_literal: true

module YouCanBookMe
  class Question
    include ModelUtils

    # @return [String]
    attr_accessor :after
    # @return [String]
    attr_accessor :before
    # @return [String]
    attr_accessor :code
    # @return [Array<String>]
    attr_accessor :options
    # @return [Boolean]
    attr_accessor :required
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :validation
    # @return [String]
    attr_accessor :validationMessage
  end
end
