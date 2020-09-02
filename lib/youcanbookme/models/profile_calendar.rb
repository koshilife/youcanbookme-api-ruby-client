# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's ProfileCalendar model.
  class ProfileCalendar
    include ModelUtils

    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :timeZone
    # @return [String]
    attr_accessor :title
    # @return [String]
    attr_accessor :url
    # @return [String]
    attr_accessor :userName
    # @return [Boolean]
    attr_accessor :writeable
  end
end
