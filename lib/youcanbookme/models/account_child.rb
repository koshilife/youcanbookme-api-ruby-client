# frozen_string_literal: true

module YouCanBookMe
  class AccountChild
    include ModelUtils

    ASSOCIATION = {
      profiles: Profile
    }.freeze

    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :id
    # @return [Boolean]
    attr_accessor :parentId
    # @return [Array<Profile>]
    attr_accessor :profiles
  end
end
