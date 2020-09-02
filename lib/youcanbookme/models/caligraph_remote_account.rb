# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's CaligraphRemoteAccount model.
  class CaligraphRemoteAccount
    include ModelUtils

    ASSOCIATION = {
      calendars: CaligraphCalendar
    }.freeze

    # @return [Array<YouCanBookMe::CaligraphCalendar>]
    attr_accessor :calendars
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :localAccountEmail
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :username
  end
end
