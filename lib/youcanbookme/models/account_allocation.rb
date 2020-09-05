# frozen_string_literal: true

module YouCanBookMe
  class AccountAllocation
    include ModelUtils

    # @return [String]
    attr_accessor :caligraphId
    # @return [String]
    attr_accessor :email
    # @return [Boolean]
    attr_accessor :ghost
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :parentCaligraphId
    # @return [String]
    attr_accessor :parentId
    # @return [Integer]
    attr_accessor :quantityAllocated
  end
end
