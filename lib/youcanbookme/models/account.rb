# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Account model.
  class Account
    include ModelUtils

    ASSOCIATION = {
      children: Account,
      localAccount: CaligraphLocalAccount,
      parent: Account,
      profiles: Profile,
      warnings: Warning
    }.freeze

    # @return [String]
    attr_accessor :caligraphKey
    # @return [Array<YouCanBookMe::Account>]
    attr_accessor :children
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
    attr_accessor :createdAt
    # @return [Integer]
    attr_accessor :deleteBookingsAfterDays
    # @return [Integer]
    attr_accessor :deletedBookingsCount
    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :familyName
    # @return [Integer]
    attr_accessor :feeCredit
    # @return [String]
    attr_accessor :givenName
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
    # @return [YouCanBookMe::CaligraphLocalAccount]
    attr_accessor :localAccount
    # @return [String]
    attr_accessor :locale
    # @return [Account]
    attr_accessor :loggedIn
    # @return [String]
    attr_accessor :organisation
    # @return [YouCanBookMe::Account]
    attr_accessor :parent
    # @return [String]
    attr_accessor :parentId
    # @return [Boolean]
    attr_accessor :privilegedLogin
    # @return [Array<YouCanBookMe::Profile>]
    attr_accessor :profiles
    # @return [String]
    attr_accessor :realtimeTopic
    # @return [String]
    attr_accessor :requestedAction
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
    # @return [Integer]
    attr_accessor :smsCredits
    # @return [String]
    attr_accessor :stripeAccessToken
    # @return [String]
    attr_accessor :stripePublishableKey
    # @return [String]
    attr_accessor :stripeRefreshToken
    # @return [String]
    attr_accessor :stripeUserId
    # @return [String]
    attr_accessor :tags
    # @return [Boolean]
    attr_accessor :terms
    # @return [String]
    attr_accessor :termsDate
    # @return [String]
    attr_accessor :timeZone
    # @return [String]
    attr_accessor :uploadCode
    # @return [Array<YouCanBookMe::Warning>]
    attr_accessor :warnings
    # @return [Boolean]
    attr_accessor :welcomed
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
