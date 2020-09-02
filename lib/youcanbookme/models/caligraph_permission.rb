# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's CaligraphPermission model.
  class CaligraphPermission
    include ModelUtils

    ASSOCIATION = {
      fromLocalAccount: CaligraphSafeLocalAccount,
      toLocalAccount: CaligraphSafeLocalAccount
    }.freeze

    # @return [String]
    attr_accessor :createdAt
    # @return [String]
    attr_accessor :expiresAt
    # @return [YouCanBookMe::CaligraphSafeLocalAccount]
    attr_accessor :fromLocalAccount
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :resource
    # @return [String]
    attr_accessor :status
    # @return [YouCanBookMe::CaligraphSafeLocalAccount]
    attr_accessor :toLocalAccount
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :updatedAt
  end
end
