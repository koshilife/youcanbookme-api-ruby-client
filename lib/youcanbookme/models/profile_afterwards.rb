# frozen_string_literal: true

module YouCanBookMe
  class ProfileAfterwards
    include ModelUtils

    ASSOCIATION = {
      bookerEvent: TemplateEvent,
      ownerEvent: TemplateEvent
    }.freeze

    # @return [YouCanBookMe::TemplateEvent]
    attr_accessor :bookerEvent
    # @return [String]
    attr_accessor :bookingDescription
    # @return [String]
    attr_accessor :bookingLocation
    # @return [String]
    attr_accessor :bookingTitle
    # @return [Boolean]
    attr_accessor :isUrl
    # @return [YouCanBookMe::TemplateEvent]
    attr_accessor :ownerEvent
    # @return [Boolean]
    attr_accessor :scrollToTop
    # @return [String]
    attr_accessor :text
    # @return [Boolean]
    attr_accessor :updateWholeBrowserWindow
    # @return [String]
    attr_accessor :url
  end
end
