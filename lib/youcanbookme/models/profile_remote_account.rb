# frozen_string_literal: true

module YouCanBookMe
  class ProfileRemoteAccount
    include ModelUtils

    ASSOCIATION = {
      calendars: ProfileCalendar
    }.freeze

    # @return [String]
    attr_accessor :accountEmail
    # @return [Array<YouCanBookMe::ProfileCalendar>]
    attr_accessor :calendars
    # @return [String]
    attr_accessor :id
    # @return [Boolean]
    attr_accessor :lobbySupport
    # @return [String]
    attr_accessor :localAccountEmail
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :username
  end
end
