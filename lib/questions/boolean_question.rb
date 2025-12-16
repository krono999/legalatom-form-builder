class BooleanQuestion < Question
  OPTIONS = [
    { label: "Yes", value: true },
    { label: "No", value: false }
  ]

  def render(response_value = nil)
    OPTIONS.map do |opt|
      marker = (response_value == opt[:value]) ? "(x)" : "( )"
      " - #{marker} #{opt[:label]} (value: #{opt[:value]})"
    end.join("\n")
  end
end