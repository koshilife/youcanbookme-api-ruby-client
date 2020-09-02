# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileTeamMembers model.
  class ProfileTeamMembers
    include ModelUtils

    ASSOCIATION = {
      items: ProfileTeamMember
    }.freeze

    # @return [Boolean]
    attr_accessor :active
    # @return [String]
    attr_accessor :allocationStrategy
    # @return [Boolean]
    attr_accessor :allowTeamMemberChangeOnReschedule
    # @return [Boolean]
    attr_accessor :assumeNoPreferenceOption
    # @return [String]
    attr_accessor :description
    # @return [Boolean]
    attr_accessor :includeNoPreferenceOption
    # @return [Array<YouCanBookMe::ProfileTeamMember>]
    attr_accessor :items
    # @return [Boolean]
    attr_accessor :randomOrder
  end
end
