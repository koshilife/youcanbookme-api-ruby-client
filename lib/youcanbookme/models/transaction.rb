# frozen_string_literal: true

module YouCanBookMe
  class Transaction
    include ModelUtils

    ASSOCIATION = {
      account: Account,
      linked: Transaction,
      purchase: Purchase
    }.freeze

    # @return [YouCanBookMe::Account]
    attr_accessor :account
    # @return [String]
    attr_accessor :accountId
    # @return [String]
    attr_accessor :createdAt
    # @return [String]
    attr_accessor :description
    # @return [Integer]
    attr_accessor :gross
    # @return [String]
    attr_accessor :id
    # @return [YouCanBookMe::Transaction]
    attr_accessor :linked
    # @return [String]
    attr_accessor :localAccountId
    # @return [Integer]
    attr_accessor :net
    # @return [YouCanBookMe::Purchase]
    attr_accessor :purchase
    # @return [String]
    attr_accessor :purchaseId
    # @return [String]
    attr_accessor :remoteId
    # @return [Integer]
    attr_accessor :tax
    # @return [String]
    # ['INVOICE', 'CREDIT_NOTE', 'FAILED_PAYMENT', 'PAYMENT', 'REFUND', 'CREDIT', 'USE_OF_CREDIT']
    attr_accessor :type
    # @return [String]
    attr_accessor :updatedAt
  end
end
