# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's PurchasesSyncChanges model.
  class PurchasesSyncChanges
    include ModelUtils

    # @return [Boolean]
    attr_accessor :hasValue
    # @return [String]
    attr_accessor :plan
    # @return [String]
    attr_accessor :planExpiresAt
    # @return [Integer]
    attr_accessor :quantityPaidFor
    # @return [String]
    attr_accessor :trialEndsAt
  end
end
