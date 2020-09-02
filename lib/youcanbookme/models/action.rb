# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Action model.
  class Action
    include ModelUtils

    # @return [String]
    attr_accessor :accountId
    # @return [String]
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
    attr_accessor :type
    # @return [String]
    attr_accessor :updated
    # @return [Boolean]
    attr_accessor :withinQuota
    # @return [Boolean]
    attr_accessor :ycbmBranded
  end
end
