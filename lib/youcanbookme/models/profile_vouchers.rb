# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileVouchers model.
  class ProfileVouchers
    include ModelUtils

    # @return [Boolean]
    attr_accessor :active
    # @return [String]
    attr_accessor :codeAlreadyUsedMessage
    # @return [String]
    attr_accessor :voucherAlreadyUsedMessage
    # @return [Array<String>]
    attr_accessor :vouchers
  end
end
