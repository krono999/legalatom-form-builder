require_relative 'condition'

class ValueCheckCondition < VisibilityCondition
  attr_reader :question_id, :expected_value

  def initialize(question_id:, value:)
    @question_id = question_id
    @expected_value = value
  end

  def satisfied?(responses, form_id)
    response = responses.dig(form_id, question_id)
    response == expected_value
  end
end