require 'yaml'
require_relative 'lib/questionnaire'
require_relative 'lib/printer'

def parse_arguments
  configs = []
  responses_path = nil

  ARGV.each do |arg|
    if arg.start_with?("--config=")
      configs = arg.sub("--config=", "").split(",")
    elsif arg.start_with?("--responses=")
      responses_path = arg.sub("--responses=", "")
    end
  end

  responses = responses_path ? YAML.load_file(responses_path) : {}

  { config_paths: configs, responses: responses }
end

args = parse_arguments

questionnaires = args[:config_paths].map do |path|
  Questionnaire.from_yaml(path.strip)
end

Printer.print(questionnaires, args[:responses])