# frozen_string_literal: true

module YouCanBookMe
  class Permission
    include ModelUtils

    ASSOCIATION = {
      databaseVersion: Permission,
      fromAccount: Account,
      fromLocalAccount: Account,
      toAccount: Account,
      toLocalAccount: Account
    }.freeze

    # @return [String]
    attr_accessor :createdAt
    # @return [YouCanBookMe::Permission]
    attr_accessor :databaseVersion
    # @return [String]
    attr_accessor :expiresAt
    # @return [YouCanBookMe::Account]
    attr_accessor :fromAccount
    # @return [YouCanBookMe::Account]
    attr_accessor :fromLocalAccount
    # @return [String]
    attr_accessor :id
    # @return [String]
    # ['pushRequest']
    attr_accessor :requestedAction
    # @return [String]
    attr_accessor :resource
    # @return [String]
    # ['REQUESTED', 'CONFIRMED', 'REJECTED']
    attr_accessor :status
    # @return [Integer]
    attr_accessor :statusHibernate
    # @return [YouCanBookMe::Account]
    attr_accessor :toAccount
    # @return [YouCanBookMe::Account]
    attr_accessor :toLocalAccount
    # @return [String]
    # ['ACCOUNTANCY', 'ACCOUNT_ADMINISTRATE', 'ACCOUNT_READ', 'ACCOUNT_WRITE', 'CALENDAR_READ', 'CALENDAR_WRITE',
    #  'GROUP_SUPPORT', 'PERMISSION_RECEIVE', 'PROFILE_CSS_WRITE', 'PROFILE_READ', 'PROFILE_WRITE', 'REFUND',
    #  'REMOTE_ACCOUNT_READ', 'REMOTE_ACCOUNT_WRITE']
    attr_accessor :type
    # @return [String]
    attr_accessor :typeHibernate
    # @return [String]
    attr_accessor :updatedAt
  end
end
