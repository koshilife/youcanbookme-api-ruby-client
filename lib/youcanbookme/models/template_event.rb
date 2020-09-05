# frozen_string_literal: true

module YouCanBookMe
  class TemplateEvent
    include ModelUtils

    # @return [String]
    attr_accessor :description
    # @return [String]
    attr_accessor :location
    # @return [Array<String>]
    attr_accessor :participants
    # @return [String]
    attr_accessor :title
  end
end
