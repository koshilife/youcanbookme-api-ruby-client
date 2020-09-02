# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's CaligraphLocalAccount model.
  class CaligraphLocalAccount
    include ModelUtils

    ASSOCIATION = {
      permissionsIn: CaligraphPermission,
      permissionsOut: CaligraphPermission,
      remoteAccounts: CaligraphRemoteAccount
    }.freeze

    # @return [String]
    attr_accessor :apiKey
    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :id
    # @return [Boolean]
    attr_accessor :inDebugMode
    # @return [String]
    attr_accessor :lifecycle
    # @return [String]
    attr_accessor :parentId
    # @return [Array<YouCanBookMe::CaligraphPermission>]
    attr_accessor :permissionsIn
    # @return [Array<YouCanBookMe::CaligraphPermission>]
    attr_accessor :permissionsOut
    # @return [String]
    attr_accessor :plan
    # @return [Integer]
    attr_accessor :planMonths
    # @return [Integer]
    attr_accessor :quantityAllocated
    # @return [Integer]
    attr_accessor :quantityForFree
    # @return [Integer]
    attr_accessor :quantityFreeTrial
    # @return [Integer]
    attr_accessor :quantityPaidFor
    # @return [Array<YouCanBookMe::CaligraphRemoteAccount>]
    attr_accessor :remoteAccounts
    # @return [String]
    attr_accessor :trialEndsAt
  end
end
