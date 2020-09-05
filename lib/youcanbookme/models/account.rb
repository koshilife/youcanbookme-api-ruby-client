# frozen_string_literal: true

module YouCanBookMe
  class Account # rubocop:disable Metrics/ClassLength
    include ModelUtils

    ASSOCIATION = {
      allocations: AccountAllocation,
      billingNameAndAddress: NameAndAddress,
      cards: Card,
      children: AccountChild,
      loggedIn: Account,
      nextPurchase: Purchase,
      parent: AccountParent,
      parentForBilling: AccountParent,
      permissionsIn: Permission,
      permissionsOut: Permission,
      profiles: Profile,
      purchases: Purchase,
      remoteAccounts: RemoteAccount,
      syncToPurchasesChanges: PurchasesSyncChanges,
      warnings: Warning
    }.freeze

    # @return [String]
    # ['standard', 'master', 'administrator', 'editor', 'contributor', 'child', 'booker']
    attr_accessor :accountType
    # @return [String]
    attr_accessor :addressHibernate
    # @return [Array<YouCanBookMe::AccountAllocation>]
    attr_accessor :allocations
    # @return [String]
    attr_accessor :apiKey
    # @return [YouCanBookMe::NameAndAddress]
    attr_accessor :billingNameAndAddress
    # @return [boolean]
    attr_accessor :blocked
    # @return [String]
    attr_accessor :caligraphId
    # @return [Array<YouCanBookMe::Card>]
    attr_accessor :cards
    # @return [Array<YouCanBookMe::AccountChild>]
    attr_accessor :children
    # @return [String]
    attr_accessor :cityHibernate
    # @return [String]
    attr_accessor :clientState
    # @return [Boolean]
    attr_accessor :contactHigh
    # @return [Boolean]
    attr_accessor :contactImportant
    # @return [Boolean]
    attr_accessor :contactLow
    # @return [String]
    attr_accessor :contactMobile
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
    # @return [Integer]
    attr_accessor :deleteBookingsAfterDays
    # @return [Integer]
    attr_accessor :deletedBookingsCount
    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :familyName
    # @return [String]
    attr_accessor :familyNameHibernate
    # @return [Integer]
    attr_accessor :feeCredit
    # @return [Boolean]
    attr_accessor :ghost
    # @return [String]
    attr_accessor :givenName
    # @return [String]
    attr_accessor :givenNameHibernate
    # @return [String]
    attr_accessor :gmailAccessToken
    # @return [String]
    attr_accessor :gmailAccessTokenExpires
    # @return [String]
    attr_accessor :gmailAddress
    # @return [String]
    attr_accessor :gmailRefreshToken
    # @return [Boolean]
    attr_accessor :googleAppsAccount
    # @return [Boolean]
    attr_accessor :gridBranding
    # @return [Boolean]
    attr_accessor :hasBookings
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
    # ['free', 'trial', 'subscriber', 'churning', 'paused', 'churned', 'deleted']
    attr_accessor :lifecycle
    # @return [String]
    attr_accessor :locale
    # @return [YouCanBookMe::Account]
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
    attr_accessor :organisation
    # @return [String]
    attr_accessor :organizationNameHibernate
    # @return [YouCanBookMe::AccountParent]
    attr_accessor :parent
    # @return [String]
    attr_accessor :parentEmail
    # @return [YouCanBookMe::AccountParent]
    attr_accessor :parentForBilling
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
    # @return [Array<YouCanBookMe::Profile>]
    attr_accessor :profiles
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
    # ['churn', 'pause', 'resetApiKey', 'resetOneTimeToken', 'resetQuota', 'resetSessionToken',
    #  'resetZapierIntegration', review', 'revokeGmailAddon', 'revokeOneTimeToken',
    #  'revokeSalesforceIntegration', 'revokeSessionToken', 'revokeStripeIntegration',
    #  'revokeParentPermissions', 'revokeTermsDate', 'revokeZapierIntegration', 'revokeZoomIntegration',
    #  'startTrial', 'syncToPurchases']
    attr_accessor :requestedAction
    # @return [String]
    attr_accessor :reviewAt
    # @return [String]
    attr_accessor :salesforceAccessToken
    # @return [String]
    attr_accessor :salesforceEmailAddress
    # @return [String]
    attr_accessor :salesforceInstanceUrl
    # @return [String]
    attr_accessor :salesforceRefreshToken
    # @return [String]
    attr_accessor :sector
    # @return [String]
    attr_accessor :sessionToken
    # @return [String]
    attr_accessor :sessionTokenExpiresAt
    # @return [Integer]
    attr_accessor :smsCredits
    # @return [String]
    attr_accessor :source
    # @return [String]
    attr_accessor :stripeAccessToken
    # @return [String]
    attr_accessor :stripeId
    # @return [String]
    attr_accessor :stripePublishableKey
    # @return [String]
    attr_accessor :stripeRefreshToken
    # @return [String]
    attr_accessor :stripeUserId
    # @return [YouCanBookMe::PurchasesSyncChanges]
    attr_accessor :syncToPurchasesChanges
    # @return [String]
    attr_accessor :tags
    # @return [String]
    attr_accessor :taxNumber
    # @return [Boolean]
    attr_accessor :terms
    # @return [String]
    attr_accessor :termsDate
    # @return [String]
    attr_accessor :timeZone
    # @return [String]
    attr_accessor :trialEndsAt
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :updatedAt
    # @return [String]
    attr_accessor :uploadCode
    # @return [Array<YouCanBookMe::Warning>]
    attr_accessor :warnings
    # @return [Boolean]
    attr_accessor :welcomed
    # @return [String]
    attr_accessor :xeroId
    # @return [String]
    attr_accessor :zapierKey
    # @return [String]
    attr_accessor :zoomAccessToken
    # @return [String]
    attr_accessor :zoomAccessTokenExpires
    # @return [String]
    attr_accessor :zoomEmailAddress
    # @return [String]
    attr_accessor :zoomRefreshToken
  end
end
