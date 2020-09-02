# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's BookingLobby model.
  class BookingLobby
    include ModelUtils

    # @return [String]
    attr_accessor :outboundUrl
    # @return [String]
    attr_accessor :status
  end
end
