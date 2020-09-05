# frozen_string_literal: true

module YouCanBookMe
  class EventReminder
    include ModelUtils

    ASSOCIATION = {
      links: Link
    }.freeze

    # @return [String]
    # ['Email', 'PopUp', 'SMS']
    attr_accessor :form
    # @return [String]
    attr_accessor :id
    # @return [Array<YouCanBookMe::Link>]
    attr_accessor :links
    # @return [Integer]
    attr_accessor :seconds
  end
end
