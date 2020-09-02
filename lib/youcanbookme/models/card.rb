# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Card model.
  class Card
    include ModelUtils

    # @return [String]
    attr_accessor :brand
    # @return [String]
    attr_accessor :country
    # @return [String]
    attr_accessor :expDate
    # @return [String]
    attr_accessor :id
    # @return [Boolean]
    attr_accessor :isDefault
    # @return [String]
    attr_accessor :last4
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :token
  end
end
