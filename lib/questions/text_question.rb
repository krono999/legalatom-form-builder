require_relative '../question'

class TextQuestion < Question
  attr_reader :min_length, :max_length

  def initialize(id:, text:, min_length: nil, max_length: nil, visibility: nil)
    super(id: id, text: text, visibility: visibility)
    @min_length = min_length
    @max_length = max_length
  end

  def description
    desc = []
    desc << "at least #{min_length} characters" if min_length
    desc << "at most #{max_length} characters" if max_length
    "You can enter #{desc.join(' and ')}." unless desc.empty?
  end

  def render(_response_value = nil)
    ""
  end
end