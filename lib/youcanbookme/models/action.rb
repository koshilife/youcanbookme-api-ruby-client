# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Action model.
  class Action
    include ModelUtils

    # @return [String]
    attr_accessor :accountId
    # @return [String]
    # ['BOOKING_CREATED', 'BOOKING_RESCHEDULED', 'BOOKING_CANCELLED', 'BOOKING_RESCHEDULED_BY_OWNER',
    #  'BOOKING_RESCHEDULED_BY_BOOKER', 'BOOKING_CANCELLED_BY_OWNER', 'BOOKING_CANCELLED_BY_BOOKER', 'BOOKING_ACCEPTED',
    #  'BOOKING_REJECTED', 'BOOKING_STARTS', 'BOOKING_ENDS', 'booked', 'rescheduled', 'cancelled', 'start', 'end']
    attr_accessor :anchor
    # @return [Boolean]
    attr_accessor :attachIcs
    # @return [String]
    attr_accessor :body
    # @return [String]
    attr_accessor :bookingId
    # @return [String]
    attr_accessor :cc
    # @return [String]
    attr_accessor :created
    # @return [Integer]
    attr_accessor :creditsUsed
    # @return [String]
    attr_accessor :defaultAsString
    # @return [Boolean]
    attr_accessor :deletable
    # @return [String]
    attr_accessor :displayFiredAtMediumMedium
    # @return [String]
    attr_accessor :displayFiredAtMediumShort
    # @return [String]
    attr_accessor :displayFiredAtShortShort
    # @return [String]
    attr_accessor :displayLocale
    # @return [String]
    attr_accessor :displayTimeZone
    # @return [String]
    attr_accessor :displayTypeLong
    # @return [String]
    attr_accessor :displayTypeShort
    # @return [Boolean]
    attr_accessor :editable
    # @return [String]
    attr_accessor :emailId
    # @return [String]
    attr_accessor :fireAt
    # @return [Boolean]
    attr_accessor :fireAtForceWeekday
    # @return [String]
    attr_accessor :firedAt
    # @return [String]
    attr_accessor :fromAddress
    # @return [String]
    attr_accessor :fromName
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :imageUrl
    # @return [String]
    attr_accessor :locale
    # @return [Integer]
    attr_accessor :offsetMinutes
    # @return [String]
    attr_accessor :parentId
    # @return [String]
    attr_accessor :profileId
    # @return [String]
    # ['PREDICTION', 'TEMPLATE', 'OVERRIDEN', 'SKIPPED', 'SUCCEEDED', 'FAILED']
    attr_accessor :status
    # @return [String]
    attr_accessor :stylingTemplate
    # @return [String]
    attr_accessor :subject
    # @return [String]
    attr_accessor :timeZone
    # @return [String]
    attr_accessor :timeline
    # @return [String]
    attr_accessor :title
    # @return [String]
    attr_accessor :to
    # @return [String]
    # ['ZAP', 'WEBHOOK', 'EMAIL', 'SMS', 'SALESFORCE_TASK', 'SALESFORCE_UPSERT']
    attr_accessor :type
    # @return [String]
    attr_accessor :updated
    # @return [Boolean]
    attr_accessor :withinQuota
    # @return [Boolean]
    attr_accessor :ycbmBranded
  end
end
