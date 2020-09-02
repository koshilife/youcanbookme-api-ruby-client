# frozen_string_literal: true

require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  'youcanbookme' => 'YouCanBookMe'
)
loader.collapse('**/models')
loader.setup

# module for YouCanBook.me apis client
module YouCanBookMe
  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
