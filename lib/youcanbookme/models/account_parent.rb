# frozen_string_literal: true

module YouCanBookMe
  class AccountParent
    include ModelUtils

    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :id
    # @return [Integer]
    attr_accessor :quantityPaidFor
  end
end
