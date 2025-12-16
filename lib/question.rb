class Question
  attr_reader :id, :text, :visibility

  def initialize(id:, text:, visibility: nil)
    @id = id
    @text = text
    @visibility = visibility
  end

  def visible?(responses, form_id)
    return true if visibility.nil?
    visibility.satisfied?(responses, form_id)
  end

  def options
    []
  end

  def render(response_value = nil)
    raise NotImplementedError
  end

  def description
    ""
  end
end