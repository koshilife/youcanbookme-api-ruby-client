# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's CaligraphCalendar model.
  class CaligraphCalendar
    include ModelUtils

    ASSOCIATION = { links: CaligraphLink }.freeze

    # @return [Boolean]
    attr_accessor :deleted
    # @return [String]
    attr_accessor :id
    # @return [Array<YouCanBookMe::CaligraphLink>]
    attr_accessor :links
    # @return [Integer]
    attr_accessor :permissionLevel
    # @return [Boolean]
    attr_accessor :primary
    # @return [String]
    attr_accessor :remoteAccountId
    # @return [String]
    attr_accessor :timeZone
    # @return [String]
    attr_accessor :title
    # @return [String]
    attr_accessor :userName
  end
end
