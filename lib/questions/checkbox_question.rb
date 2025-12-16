class CheckboxQuestion < Question
  attr_reader :options

  def initialize(id:, text:, preset: nil, visibility: nil)
    super(id: id, text: text, visibility: visibility)
    @options = preset_options(preset) || []
  end

  def render(_response_value = nil)
    options.map do |opt|
      " - [ ] #{opt[:label]} (value: '#{opt[:value]}')"
    end.join("\n")
  end

  private

  def preset_options(preset)
    case preset
    when "ethnicities" then Presets::ETHNICITIES
    else []
    end
  end
end