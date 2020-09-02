# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's CaligraphLink model.
  class CaligraphLink
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
