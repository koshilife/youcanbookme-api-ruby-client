# frozen_string_literal: true

module YouCanBookMe
  class Provider
    include ModelUtils

    ASSOCIATION = {
      remoteAccount: RemoteAccount
    }.freeze

    # @return [Boolean]
    attr_accessor :flushCache
    # @return [YouCanBookMe::RemoteAccount]
    attr_accessor :remoteAccount
  end
end
