# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's CaligraphSafeLocalAccount model.
  class CaligraphSafeLocalAccount
    include ModelUtils

    # @return [String]
    attr_accessor :email
    # @return [String]
    attr_accessor :id
  end
end
