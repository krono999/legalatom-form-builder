require_relative '../question'
require_relative '../presets'

class DropdownQuestion < Question
  attr_reader :options

  def initialize(id:, text:, preset: nil, visibility: nil)
    super(id: id, text: text, visibility: visibility)
    @options = preset_options(preset)
  end

  def render(_response_value = nil)
    lines = ["#{text} (dropdown question)"]
    options.each do |opt|
      lines << " - < > #{opt[:label]} (value: '#{opt[:value]}')"
    end
    lines.join("\n")
  end

  private

  def preset_options(preset)
    case preset
    when "states"    then Presets::STATES
    when "countries" then Presets::COUNTRIES
    else []
    end
  end
end