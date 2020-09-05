# frozen_string_literal: true

module YouCanBookMe
  class ProfileDisplay
    include ModelUtils

    # @return [Boolean]
    attr_accessor :bustMobile
    # @return [String]
    attr_accessor :colorBusySlot
    # @return [String]
    attr_accessor :colorFreeSlot
    # @return [String]
    attr_accessor :colorHeader
    # @return [String]
    attr_accessor :css
    # @return [String]
    attr_accessor :fontHeader
    # @return [String]
    attr_accessor :fontHeaderColor
    # @return [Integer]
    attr_accessor :fontHeaderSize
    # @return [String]
    attr_accessor :fontParagraph
    # @return [String]
    attr_accessor :fontParagraphColor
    # @return [Integer]
    attr_accessor :fontParagraphSize
    # @return [String]
    attr_accessor :fontSub
    # @return [String]
    attr_accessor :fontSubColor
    # @return [Integer]
    attr_accessor :fontSubSize
    # @return [String]
    attr_accessor :footer
    # @return [String]
    attr_accessor :header
    # @return [Integer]
    attr_accessor :periodShownPerPageDays
    # @return [Boolean]
    attr_accessor :showJumpDate
    # @return [Boolean]
    attr_accessor :showPeriods
    # @return [Boolean]
    attr_accessor :showTimeZone
    # @return [Boolean]
    attr_accessor :showUncheckedDays
    # @return [String]
    attr_accessor :theme
    # @return [Boolean]
    attr_accessor :widthCss
  end
end
