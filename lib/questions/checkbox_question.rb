require_relative '../question'
require_relative '../presets'

class CheckboxQuestion < Question
  def initialize(id:, text:, preset: nil, visibility: nil)
    super(id: id, text: text, visibility: visibility)
    @options = preset_options(preset)
  end

  def options
    @options
  end

  def render(_response_values = nil)
    lines = ["#{text} (checkbox question)"]
    options.each do |opt|
      lines << " - [ ] #{opt[:label]} (value: '#{opt[:value]}')"
    end
    lines.join("\n")
  end

  private

  def preset_options(preset)
    case preset
    when "ethnicities" then Presets::ETHNICITIES
    else []
    end
  end
end