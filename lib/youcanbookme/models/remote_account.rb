# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's RemoteAccount model.
  class RemoteAccount
    include ModelUtils

    ASSOCIATION = {
      calendars: Calendar,
      databaseVersion: RemoteAccount,
      links: Link,
      localAccount: LocalAccount,
      provider: Provider
    }.freeze

    # @return [String]
    attr_accessor :accessToken
    # @return [String]
    attr_accessor :accessTokenExpiresAt
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
    # @return [YouCanBookMe::LocalAccount>]
    attr_accessor :localAccount
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
