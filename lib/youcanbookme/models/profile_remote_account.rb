# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileRemoteAccount model.
  class ProfileRemoteAccount
    include ModelUtils

    ASSOCIATION = {
      calendars: ProfileCalendar
    }

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
