# frozen_string_literal: true

module YouCanBookMe
  # YouCanBook.me logger utility module.
  module Loggable
    def error_log(msg)
      log msg, :error
    end

    def warn_log(msg)
      log msg, :warn
    end

    def info_log(msg)
      log msg, :info
    end

    def debug_log(msg)
      log msg, :debug
    end

    private

    def log(msg, level = :info)
      logger = YouCanBookMe.configuration.logger
      return unless logger
      return unless logger.respond_to? level

      logger.send level, msg
    end
  end
end
