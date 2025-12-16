require_relative 'condition'

class AndCondition < VisibilityCondition
  attr_reader :conditions

  def initialize(conditions:)
    @conditions = conditions
  end

  def satisfied?(responses, form_id)
    conditions.all? { |c| c.satisfied?(responses, form_id) }
  end
end