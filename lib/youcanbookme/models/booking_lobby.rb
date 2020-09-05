# frozen_string_literal: true

module YouCanBookMe
  class BookingLobby
    include ModelUtils

    # @return [String]
    attr_accessor :outboundUrl
    # @return [String]
    # ['UNKNOWN', 'PROBLEM_SUBSCRIPTION', 'PROBLEM_CANCELLED', 'PROBLEM_UNDECIDED', 'PROBLEM_TEMPORARY',
    #  'PROBLEM_NO_INTEGRATION', 'WAITING', 'FORWARDING', 'CLOSED']
    attr_accessor :status
  end
end
