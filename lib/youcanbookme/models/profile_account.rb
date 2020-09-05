# frozen_string_literal: true

module YouCanBookMe
  class ProfileAccount
    include ModelUtils

    ASSOCIATION = {
      remoteAccounts: ProfileRemoteAccount
    }.freeze

    # @return [String]
    attr_accessor :accountId
    # @return [String]
    attr_accessor :email
    # @return [Array<YouCanBookMe::ProfileRemoteAccount>]
    attr_accessor :remoteAccounts
  end
end
