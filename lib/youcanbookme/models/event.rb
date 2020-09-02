# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Event model.
  class Event
    include ModelUtils

    ASSOCIATION = {
      calendar: Calendar,
      links: Link,
      participants: Participant,
      reminders: Reminder
    }.freeze

    # @return [String]
    attr_accessor :backgroundColor
    # @return [YouCanBookMe::Calendar]
    attr_accessor :calendar
    # @return [Boolean]
    attr_accessor :confidential
    # @return [Boolean]
    attr_accessor :confidentialOnly
    # @return [String]
    attr_accessor :createdAt
    # @return [Boolean]
    attr_accessor :dateOnly
    # @return [Integer]
    attr_accessor :defaultShareLevel
    # @return [String]
    attr_accessor :description
    # @return [String]
    attr_accessor :end
    # @return [String]
    attr_accessor :endDate
    # @return [String]
    attr_accessor :endDateTime
    # @return [String]
    attr_accessor :endInstant
    # @return [String]
    attr_accessor :endTimeZone
    # @return [String]
    attr_accessor :endZonedDateTime
    # @return [Boolean]
    attr_accessor :failed
    # @return [String]
    attr_accessor :failure
    # @return [String]
    attr_accessor :foregroundColor
    # @return [Boolean]
    attr_accessor :hasDescription
    # @return [String]
    attr_accessor :id
    # @return [Array<YouCanBookMe::Link>]
    attr_accessor :links
    # @return [String]
    attr_accessor :location
    # @return [String]
    attr_accessor :metadata
    # @return [Array<YouCanBookMe::Participant>]
    attr_accessor :participants
    # @return [Boolean]
    attr_accessor :private
    # @return [Boolean]
    attr_accessor :privateOnly
    # @return [Boolean]
    attr_accessor :public
    # @return [Boolean]
    attr_accessor :publicOnly
    # @return [Array<String>]
    attr_accessor :recurrences
    # @return [Array<YouCanBookMe::Reminder>]
    attr_accessor :reminders
    # @return [Boolean]
    attr_accessor :restricted
    # @return [Boolean]
    attr_accessor :restrictedOnly
    # @return [String]
    attr_accessor :revision
    # @return [String]
    attr_accessor :start
    # @return [String]
    attr_accessor :startDate
    # @return [String]
    attr_accessor :startDateTime
    # @return [String]
    attr_accessor :startInstant
    # @return [String]
    attr_accessor :startTimeZone
    # @return [String]
    attr_accessor :startZonedDateTime
    # @return [String]
    attr_accessor :status
    # @return [String]
    attr_accessor :title
    # @return [Boolean]
    attr_accessor :transparent
  end
end
