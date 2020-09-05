# frozen_string_literal: true

module YouCanBookMe
  class ProfileCalendars
    include ModelUtils

    ASSOCIATION = {
      targetCalendar: ProfileCalendar
    }.freeze

    # @return [Array<String>]
    attr_accessor :calendarIds
    # @return [YouCanBookMe::ProfileCalendar]
    attr_accessor :targetCalendar
    # @return [String]
    attr_accessor :targetCalendarId
  end
end
