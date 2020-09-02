# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Purchase model.
  class Purchase
    include ModelUtils

    ASSOCIATION = {
      localAccount: LocalAccount,
      nameAndAddress: NameAndAddress,
      transactions: Transaction,
      transactionsSorted: Transaction
    }.freeze

    # @return [Integer]
    attr_accessor :accountDiscount
    # @return [Boolean]
    attr_accessor :active
    # @return [Integer]
    attr_accessor :additionalDiscount
    # @return [Integer]
    attr_accessor :additionalDiscountPermyriadRequested
    # @return [String]
    attr_accessor :addressHibernate
    # @return [Integer]
    attr_accessor :afterDiscounts
    # @return [Integer]
    attr_accessor :balance
    # @return [Integer]
    attr_accessor :beforeDiscounts
    # @return [String]
    attr_accessor :cardId
    # @return [String]
    attr_accessor :cityHibernate
    # @return [String]
    attr_accessor :countryHibernate
    # @return [String]
    attr_accessor :createdAt
    # @return [String]
    attr_accessor :currency
    # @return [Integer]
    attr_accessor :currencyFactor
    # @return [String]
    attr_accessor :date
    # @return [String]
    attr_accessor :displayLocale
    # @return [String]
    attr_accessor :familyNameHibernate
    # @return [String]
    attr_accessor :givenNameHibernate
    # @return [Integer]
    attr_accessor :gross
    # @return [Boolean]
    attr_accessor :hasTax
    # @return [String]
    attr_accessor :id
    # @return [Boolean]
    attr_accessor :liableForVAT
    # @return [YouCanBookMe::LocalAccount]
    attr_accessor :localAccount
    # @return [String]
    attr_accessor :localAccountId
    # @return [Integer]
    attr_accessor :longPeriodDiscount
    # @return [Integer]
    attr_accessor :months
    # @return [YouCanBookMe::NameAndAddress]
    attr_accessor :nameAndAddress
    # @return [Boolean]
    attr_accessor :needsPayment
    # @return [Integer]
    attr_accessor :net
    # @return [String]
    attr_accessor :number
    # @return [String]
    attr_accessor :organizationNameHibernate
    # @return [Integer]
    attr_accessor :payment
    # @return [String]
    attr_accessor :paymentIntentId
    # @return [String]
    attr_accessor :postalCodeHibernate
    # @return [Integer]
    attr_accessor :proRataPermyriadUsed
    # @return [String]
    attr_accessor :product
    # @return [String]
    attr_accessor :provisionEnd
    # @return [String]
    attr_accessor :provisionStart
    # @return [Integer]
    attr_accessor :quantity
    # @return [String]
    attr_accessor :refundCode
    # @return [String]
    attr_accessor :regionHibernate
    # @return [String]
    attr_accessor :requestedAction
    # @return [Boolean]
    attr_accessor :retryPayment
    # @return [String]
    attr_accessor :setUpMode
    # @return [Integer]
    attr_accessor :shortPeriodDiscount
    # @return [String]
    attr_accessor :status
    # @return [Integer]
    attr_accessor :tax
    # @return [String]
    attr_accessor :taxNumber
    # @return [Integer]
    attr_accessor :totalDiscount
    # @return [Array<YouCanBookMe::Transaction>]
    attr_accessor :transactions
    # @return [Array<YouCanBookMe::Transaction>]
    attr_accessor :transactionsSorted
    # @return [String]
    attr_accessor :type
    # @return [Integer]
    attr_accessor :unitPrice
    # @return [String]
    attr_accessor :updatedAt
    # @return [Integer]
    attr_accessor :volumeDiscount
  end
end
