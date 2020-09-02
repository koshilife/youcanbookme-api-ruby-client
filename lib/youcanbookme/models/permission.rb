# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Permission model.
  class Permission
    include ModelUtils

    ASSOCIATION = {
      databaseVersion: Permission,
      fromLocalAccount: LocalAccount,
      toLocalAccount: LocalAccount
    }.freeze

    # @return [String]
    attr_accessor :createdAt
    # @return [YouCanBookMe::Permission]
    attr_accessor :databaseVersion
    # @return [String]
    attr_accessor :expiresAt
    # @return [YouCanBookMe::LocalAccount]
    attr_accessor :fromLocalAccount
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :requestedAction
    # @return [String]
    attr_accessor :resource
    # @return [String]
    attr_accessor :status
    # @return [Integer]
    attr_accessor :statusHibernate
    # @return [YouCanBookMe::LocalAccount]
    attr_accessor :toLocalAccount
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :updatedAt
  end
end
