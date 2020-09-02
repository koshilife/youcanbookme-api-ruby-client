# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileTimes model.
  class ProfileTimes
    include ModelUtils

    # @return [Integer]
    attr_accessor :bookingPaddingMinutes
    # @return [String]
    attr_accessor :breakEnd
    # @return [String]
    attr_accessor :breakStart
    # @return [Integer]
    attr_accessor :defaultNumberOfSlots
    # @return [String]
    attr_accessor :fixedEnd
    # @return [String]
    attr_accessor :fixedStart
    # @return [Boolean]
    attr_accessor :friActive
    # @return [String]
    attr_accessor :friEnd
    # @return [String]
    attr_accessor :friStart
    # @return [Integer]
    attr_accessor :maxNoticeDays
    # @return [Integer]
    attr_accessor :maxNumberOfSlots
    # @return [Integer]
    attr_accessor :minNoticeMinutes
    # @return [Integer]
    attr_accessor :minNumberOfSlots
    # @return [Boolean]
    attr_accessor :monActive
    # @return [String]
    attr_accessor :monEnd
    # @return [String]
    attr_accessor :monStart
    # @return [String]
    attr_accessor :onDutyToken
    # @return [Boolean]
    attr_accessor :satActive
    # @return [String]
    attr_accessor :satEnd
    # @return [String]
    attr_accessor :satStart
    # @return [Integer]
    attr_accessor :slotLengthMinutes
    # @return [String]
    attr_accessor :startingDayOfWeek
    # @return [Boolean]
    attr_accessor :sunActive
    # @return [String]
    attr_accessor :sunEnd
    # @return [String]
    attr_accessor :sunStart
    # @return [Boolean]
    attr_accessor :thuActive
    # @return [String]
    attr_accessor :thuEnd
    # @return [String]
    attr_accessor :thuStart
    # @return [Boolean]
    attr_accessor :tueActive
    # @return [String]
    attr_accessor :tueEnd
    # @return [String]
    attr_accessor :tueStart
    # @return [Integer]
    attr_accessor :unitsPerSlot
    # @return [Boolean]
    attr_accessor :wedActive
    # @return [String]
    attr_accessor :wedEnd
    # @return [String]
    attr_accessor :wedStart
  end
end
