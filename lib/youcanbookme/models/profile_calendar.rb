# frozen_string_literal: true

module YouCanBookMe
  class ProfileCalendar
    include ModelUtils

    ASSOCIATION = {
      calendar: Calendar
    }.freeze

    # @return [YouCanBookMe::Calendar]
    attr_accessor :calendar
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :timeZone
    # @return [String]
    attr_accessor :title
    # @return [String]
    attr_accessor :url
    # @return [String]
    attr_accessor :userName
    # @return [Boolean]
    attr_accessor :writeable
  end
end
