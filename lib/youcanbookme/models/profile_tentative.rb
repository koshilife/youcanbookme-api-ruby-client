# frozen_string_literal: true

module YouCanBookMe
  class ProfileTentative
    include ModelUtils

    # @return [Boolean]
    attr_accessor :active
    # @return [Boolean]
    attr_accessor :autoRejectActive
    # @return [Integer]
    attr_accessor :autoRejectAfterMinutes
  end
end
