# frozen_string_literal: true

module YouCanBookMe
  class Warning
    include ModelUtils

    # @return [String]
    attr_accessor :code
    # @return [String]
    attr_accessor :fixUrl
    # @return [String]
    attr_accessor :fixUrlText
    # @return [Integer]
    attr_accessor :frequency
    # @return [Integer]
    attr_accessor :level
    # @return [String]
    attr_accessor :longText
    # @return [String]
    attr_accessor :mediumText
    # @return [Boolean]
    attr_accessor :push
    # @return [String]
    attr_accessor :shortText
  end
end
