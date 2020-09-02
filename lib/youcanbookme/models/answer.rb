# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe's Answer model.
  class Answer
    include ModelUtils

    ASSOCIATION = {
      question: Question
    }.freeze

    # @return [String]
    attr_accessor :code
    # @return [YouCanBookMe::Question]
    attr_accessor :question
    # @return [String]
    attr_accessor :string
  end
end
