# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileCancelOrReschedule model.
  class ProfileCancelOrReschedule
    include ModelUtils

    # @return [Boolean]
    attr_accessor :allowed
    # @return [String]
    attr_accessor :cancellationInstructions
    # @return [String]
    attr_accessor :limitMessage
    # @return [Integer]
    attr_accessor :limitMinutes
    # @return [Boolean]
    attr_accessor :reasonRequired
    # @return [Boolean]
    attr_accessor :showReasonTextBox
  end
end
