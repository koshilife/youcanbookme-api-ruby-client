# frozen_string_literal: true

module YouCanBookMe
  class RemoteAccount
    include ModelUtils

    ASSOCIATION = {
      account: Account,
      calendars: Calendar,
      databaseVersion: RemoteAccount,
      links: Link,
      provider: Provider
    }.freeze

    # @return [String]
    attr_accessor :accessToken
    # @return [String]
    attr_accessor :accessTokenExpiresAt
    # @return [YouCanBookMe::Account]
    attr_accessor :account
    # @return [String]
    attr_accessor :accountEmail
    # @return [String]
    attr_accessor :accountId
    # @return [String]
    attr_accessor :calendarHome
    # @return [Array<YouCanBookMe::Calendar>]
    attr_accessor :calendars
    # @return [YouCanBookMe::RemoteAccount]
    attr_accessor :databaseVersion
    # @return [Boolean]
    attr_accessor :failed
    # @return [String]
    attr_accessor :failure
    # @return [String]
    attr_accessor :host
    # @return [String]
    attr_accessor :id
    # @return [Array<YouCanBookMe::Link>]
    attr_accessor :links
    # @return [String]
    attr_accessor :localAccountEmail
    # @return [String]
    attr_accessor :localAccountId
    # @return [String]
    attr_accessor :password
    # @return [String]
    attr_accessor :principal
    # @return [YouCanBookMe::Provider]
    attr_accessor :provider
    # @return [String]
    attr_accessor :refreshToken
    # @return [String]
    # ['invalidateCache']
    attr_accessor :requestedAction
    # @return [String]
    attr_accessor :revision
    # @return [Boolean]
    attr_accessor :statusCanceledDeletesEvent
    # @return [String]
    attr_accessor :type
    # @return [Boolean]
    attr_accessor :upCalendarsRecordFailure
    # @return [String]
    attr_accessor :username
  end
end
