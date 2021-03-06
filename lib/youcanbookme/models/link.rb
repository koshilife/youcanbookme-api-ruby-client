# frozen_string_literal: true

module YouCanBookMe
  class Link
    include ModelUtils

    # @return [String]
    attr_accessor :href
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :rel
    # @return [String]
    attr_accessor :type
  end
end
