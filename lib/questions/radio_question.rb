class RadioQuestion < Question
  attr_reader :options

  def initialize(id:, text:, options: nil, preset: nil, visibility: nil)
    super(id: id, text: text, visibility: visibility)
    @options = options || preset_options(preset) || []
  end

  def render(response_value = nil)
    options.map do |opt|
      marker = (response_value == opt[:value]) ? "(x)" : "( )"
      " - #{marker} #{opt[:label]} (value: '#{opt[:value]}')"
    end.join("\n")
  end

  private

  def preset_options(preset)
    case preset
    when "genders" then Presets::GENDERS
    else []
    end
  end
end