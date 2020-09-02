# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's LocalAccount model.
  class LocalAccount
    include ModelUtils

    ASSOCIATION = {
      activePurchase: Purchase,
      allocations: LocalAccount,
      billingNameAndAddress: NameAndAddress,
      cards: Card,
      links: Link,
      loggedIn: LocalAccount,
      nextPurchase: Purchase,
      permissionsIn: Permission,
      permissionsInProcessGroups: Permission,
      permissionsOut: Permission,
      purchases: Purchase,
      remoteAccounts: RemoteAccount,
      syncToPurchasesChanges: PurchasesSyncChanges,
      warnings: Warning
    }.freeze

    # @return [String]
    attr_accessor :accountType
    # @return [YouCanBookMe::Purchase]
    attr_accessor :activePurchase
    # @return [String]
    attr_accessor :addressHibernate
    # @return [Array<YouCanBookMe::LocalAccount>]
    attr_accessor :allocations
    # @return [String]
    attr_accessor :apiKey
    # @return [integer]
    attr_accessor :balance
    # @return [YouCanBookMe::NameAndAddress]
    attr_accessor :billingNameAndAddress
    # @return [Boolean]
    attr_accessor :blocked
    # @return [Array<YouCanBookMe::Card>]
    attr_accessor :cards
    # @return [String]
    attr_accessor :cityHibernate
    # @return [String]
    attr_accessor :countryHibernate
    # @return [String]
    attr_accessor :covidStatus
    # @return [String]
    attr_accessor :createdAt
    # @return [Integer]
    attr_accessor :credit
    # @return [Integer]
    attr_accessor :creditEUR
    # @return [Integer]
    attr_accessor :creditGBP
    # @return [Integer]
    attr_accessor :creditUSD
    # @return [String]
    attr_accessor :currency
    # @return [String]
    attr_accessor :debugModeUntil
    # @return [String]
    attr_accessor :detectedTimeZone
    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :familyNameHibernate
    # @return [Boolean]
    attr_accessor :ghost
    # @return [String]
    attr_accessor :givenNameHibernate
    # @return [String]
    attr_accessor :id
    # @return [Boolean]
    attr_accessor :inDebugMode
    # @return [String]
    attr_accessor :killBillId
    # @return [String]
    attr_accessor :lastWarningPushAt
    # @return [Integer]
    attr_accessor :lastWarningPushLevel
    # @return [String]
    attr_accessor :lifecycle
    # @return [Array<YouCanBookMe::Link>]
    attr_accessor :links
    # @return [YouCanBookMe::LocalAccount]
    attr_accessor :loggedIn
    # @return [Boolean]
    attr_accessor :needsSyncToPurchases
    # @return [Integer]
    attr_accessor :negotiatedDiscountPermyriad
    # @return [YouCanBookMe::Purchase]
    attr_accessor :nextPurchase
    # @return [String]
    attr_accessor :oneTimeToken
    # @return [String]
    attr_accessor :oneTimeTokenExpiresAt
    # @return [String]
    attr_accessor :organizationNameHibernate
    # @return [String]
    attr_accessor :parentEmail
    # @return [String]
    attr_accessor :parentId
    # @return [Integer]
    attr_accessor :parentQuantityPaidFor
    # @return [String]
    attr_accessor :password
    # @return [String]
    attr_accessor :passwordHash
    # @return [Boolean]
    attr_accessor :pastDue
    # @return [Integer]
    attr_accessor :pausePlanMonths
    # @return [Integer]
    attr_accessor :pauseQuantity
    # @return [Integer]
    attr_accessor :pauseRemainingSeconds
    # @return [Boolean]
    attr_accessor :paused
    # @return [Array<YouCanBookMe::Permission>]
    attr_accessor :permissionsIn
    # @return [Array<YouCanBookMe::Permission>]
    attr_accessor :permissionsInProcessGroups
    # @return [Array<YouCanBookMe::Permission>]
    attr_accessor :permissionsOut
    # @return [String]
    attr_accessor :plan
    # @return [String]
    attr_accessor :planExpiresAt
    # @return [Integer]
    attr_accessor :planMonths
    # @return [Integer]
    attr_accessor :planMonthsWas
    # @return [String]
    attr_accessor :postalCodeHibernate
    # @return [Array<YouCanBookMe::Purchase>]
    attr_accessor :purchases
    # @return [Integer]
    attr_accessor :quantityAllocated
    # @return [Integer]
    attr_accessor :quantityForFree
    # @return [Integer]
    attr_accessor :quantityFreeTrial
    # @return [Integer]
    attr_accessor :quantityPaidFor
    # @return [String]
    attr_accessor :realtimeTopic
    # @return [String]
    attr_accessor :regionHibernate
    # @return [Array<YouCanBookMe::RemoteAccount>]
    attr_accessor :remoteAccounts
    # @return [String]
    attr_accessor :requestedAction
    # @return [String]
    attr_accessor :reviewAt
    # @return [String]
    attr_accessor :sessionToken
    # @return [String]
    attr_accessor :sessionTokenExpiresAt
    # @return [String]
    attr_accessor :source
    # @return [String]
    attr_accessor :stripeId
    # @return [YouCanBookMe::PurchasesSyncChanges]
    attr_accessor :syncToPurchasesChanges
    # @return [String]
    attr_accessor :taxNumber
    # @return [String]
    attr_accessor :trialEndsAt
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :updatedAt
    # @return [Array<YouCanBookMe::Warning>]
    attr_accessor :warnings
    # @return [String]
    attr_accessor :xeroId
  end
end
