# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Calendar model.
  class Calendar
    include ModelUtils

    ASSOCIATION = {
      events: Event,
      links: Link,
      remoteAccount: RemoteAccount
    }.freeze

    # @return [String]
    attr_accessor :backgroundColor
    # @return [Boolean]
    attr_accessor :changesRarely
    # @return [Boolean]
    attr_accessor :deleted
    # @return [String]
    attr_accessor :description
    # @return [Array<YouCanBookMe::Event>]
    attr_accessor :events
    # @return [Boolean]
    attr_accessor :failed
    # @return [String]
    attr_accessor :failure
    # @return [String]
    attr_accessor :foregroundColor
    # @return [Boolean]
    attr_accessor :freeBusy
    # @return [Boolean]
    attr_accessor :freeBusyOnly
    # @return [Boolean]
    attr_accessor :hidden
    # @return [String]
    attr_accessor :id
    # @return [Array<YouCanBookMe::Link>]
    attr_accessor :links
    # @return [Integer]
    attr_accessor :permissionLevel
    # @return [Boolean]
    attr_accessor :primary
    # @return [Boolean]
    attr_accessor :readable
    # @return [Boolean]
    attr_accessor :readableOnly
    # @return [YouCanBookMe::RemoteAccount]
    attr_accessor :remoteAccount
    # @return [String]
    attr_accessor :revision
    # @return [Boolean]
    attr_accessor :shared
    # @return [String]
    attr_accessor :systemUniqueId
    # @return [String]
    attr_accessor :timeZone
    # @return [String]
    attr_accessor :title
    # @return [String]
    attr_accessor :userName
    # @return [Boolean]
    attr_accessor :writeable
    # @return [Boolean]
    attr_accessor :writeableOnly
  end
end
