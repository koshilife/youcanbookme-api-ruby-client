# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileTentative model.
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
