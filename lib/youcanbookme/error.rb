# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe module's base error object
  class Error < StandardError
    include CommonModule

    def initialize(message = nil)
      msg = "#{self.class} occured."
      msg += " message:#{message}"
      warn_log msg
      super message
    end
  end
end
