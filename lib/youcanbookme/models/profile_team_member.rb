# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileTeamMember model.
  class ProfileTeamMember
    include ModelUtils

    ASSOCIATION = {
      targetCalendar: ProfileCalendar
    }.freeze

    # @return [String]
    attr_accessor :account
    # @return [String]
    attr_accessor :calendarId
    # @return [String]
    attr_accessor :description
    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :pic
    # @return [YouCanBookMe::ProfileCalendar]
    attr_accessor :targetCalendar
    # @return [String]
    attr_accessor :targetCalendarTimeZone
    # @return [Boolean]
    attr_accessor :targetCalendarWriteable
  end
end
