# frozen_string_literal: true

module YouCanBookMe
  class ProfileAppointmentTypes
    include ModelUtils

    ASSOCIATION = {
      items: ProfileAppointmentType
    }.freeze

    # @return [Boolean]
    attr_accessor :active
    # @return [Boolean]
    attr_accessor :combinable
    # @return [String]
    attr_accessor :description
    # @return [Boolean]
    attr_accessor :groupsActive
    # @return [String]
    attr_accessor :groupsDivider
    # @return [Array<ProfileAppointmentType>]
    attr_accessor :items
    # @return [Boolean]
    attr_accessor :randomizable
  end
end
