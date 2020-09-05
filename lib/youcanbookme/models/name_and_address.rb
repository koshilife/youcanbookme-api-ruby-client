# frozen_string_literal: true

module YouCanBookMe
  class NameAndAddress
    include ModelUtils

    # @return [String]
    attr_accessor :address
    # @return [String]
    attr_accessor :city
    # @return [String]
    attr_accessor :country
    # @return [String]
    attr_accessor :familyName
    # @return [String]
    attr_accessor :givenName
    # @return [String]
    attr_accessor :organizationName
    # @return [String]
    attr_accessor :postalCode
    # @return [String]
    attr_accessor :region
  end
end
