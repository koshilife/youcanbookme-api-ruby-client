# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileAppointmentType model.
  class ProfileAppointmentType
    include ModelUtils

    # @return [String]
    attr_accessor :description
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :name
    # @return [Integer]
    attr_accessor :numberOfSlots
    # @return [String]
    attr_accessor :pic
    # @return [Integer]
    attr_accessor :price
    # @return [Integer]
    attr_accessor :slotLengthMinutes
  end
end
