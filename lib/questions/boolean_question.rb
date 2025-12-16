require_relative '../question'

class BooleanQuestion < Question
  OPTIONS = [
    { label: "Yes", value: true },
    { label: "No", value: false }
  ]

  def render(response_value = nil)
    lines = ["#{text} (boolean question)"]
    OPTIONS.each do |opt|
      marker = (response_value == opt[:value]) ? "(x)" : "( )"
      lines << " - #{marker} #{opt[:label]} (value: #{opt[:value]})"
    end
    lines.join("\n")
  end
end