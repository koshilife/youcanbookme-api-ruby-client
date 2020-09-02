# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Transaction model.
  class Transaction
    include ModelUtils

    ASSOCIATION = {
      linked: Transaction,
      purchase: Purchase,
    }.freeze

    # @return [String]
    attr_accessor :account
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
    attr_accessor :type
    # @return [String]
    attr_accessor :updatedAt
  end
end
