require_relative 'questionnaire'
require_relative 'printer'

class FormBuilder
  def self.load(config_paths)
    config_paths.map { |path| Questionnaire.from_yaml(path) }
  end

  def self.print(config_paths, user_response)
    questionnaires = load(config_paths)
    Printer.print(questionnaires, user_response)
  end
end