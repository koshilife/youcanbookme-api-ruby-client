# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Participant model.
  class Participant
    include ModelUtils

    ASSOCIATION = {
      links: Link
    }.freeze

    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :id
    # @return [Array<YouCanBookMe::Link>]
    attr_accessor :links
    # @return [Boolean]
    attr_accessor :required
    # @return [String]
    attr_accessor :role
    # @return [String]
    attr_accessor :status
  end
end
