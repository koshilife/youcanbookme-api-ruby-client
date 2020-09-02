# frozen_string_literal: true

require 'logger'

module YouCanBookMe
  # YouCanBook.me APIs client configuration.
  class Configuration
    # @return [String]
    attr_accessor :account_id
    # @return [String]
    attr_accessor :password_or_token
    # @return [Logger]
    attr_accessor :logger

    def initialize
      @logger = Logger.new STDOUT
      @logger.level = :warn
    end
  end
end
