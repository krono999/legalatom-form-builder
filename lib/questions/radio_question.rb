require_relative '../question'
require_relative '../presets'

class RadioQuestion < Question
  attr_reader :options

  def initialize(id:, text:, options: nil, preset: nil, visibility: nil)
    super(id: id, text: text, visibility: visibility)
    @options = options || preset_options(preset)
  end

  def render(response_value = nil)
    lines = ["#{text} (radio question)"]
    options.each do |opt|
      marker = (response_value == opt[:value]) ? "(x)" : "( )"
      lines << " - #{marker} #{opt[:label]} (value: '#{opt[:value]}')"
    end
    lines.join("\n")
  end

  private

  def preset_options(preset)
    case preset
    when "genders" then Presets::GENDERS
    else []
    end
  end
end