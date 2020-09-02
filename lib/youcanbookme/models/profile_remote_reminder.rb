# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileRemoteReminder model.
  class ProfileRemoteReminder
    include ModelUtils

    # @return [String]
    attr_accessor :id
    # @return [Integer]
    attr_accessor :offsetMinutes
    # @return [String]
    attr_accessor :type
  end
end
