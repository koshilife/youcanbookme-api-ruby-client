# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Reminder model.
  class Reminder
    include ModelUtils

    ASSOCIATION = {
      links: Link
    }.freeze

    # @return [String]
    attr_accessor :orm
    # @return [String]
    attr_accessor :id
    # @return [Array<YouCanBookMe::Link>]
    attr_accessor :links
    # @return [Integer]
    attr_accessor :seconds
  end
end
