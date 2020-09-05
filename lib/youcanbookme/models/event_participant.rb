# frozen_string_literal: true

module YouCanBookMe
  class EventParticipant
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
    # ['Attendee', 'Organizer', 'Performer', 'Speaker', 'Chair', 'None', 'Optional', 'Required']
    attr_accessor :role
    # @return [String]
    # ['Accepted', 'Declined', 'Invited', 'Tentative']
    attr_accessor :status
  end
end
