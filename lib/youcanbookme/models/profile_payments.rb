# frozen_string_literal: true

module YouCanBookMe
  class ProfilePayments
    include ModelUtils

    # @return [Boolean]
    attr_accessor :active
    # @return [String]
    attr_accessor :currency
    # @return [Integer]
    attr_accessor :currencyFactor
    # @return [String]
    # ['STRIPE', 'PAYMILL']
    attr_accessor :partner
    # @return [String]
    attr_accessor :partnerDescription
    # @return [Integer]
    attr_accessor :pricePerSlot
    # @return [Integer]
    attr_accessor :roundingPrecision
  end
end
