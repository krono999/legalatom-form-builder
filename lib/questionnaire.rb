require 'yaml'
require_relative 'presets'
require_relative 'question'
require_relative 'questions/text_question'
require_relative 'questions/boolean_question'
require_relative 'questions/radio_question'
require_relative 'questions/checkbox_question'
require_relative 'questions/dropdown_question'
require_relative 'visibility/value_check_condition'
require_relative 'visibility/and_condition'

class Questionnaire
  attr_reader :id, :title, :questions

  def initialize(id:, title:, questions:)
    @id = id
    @title = title
    @questions = questions
  end

  def self.from_yaml(path)
    data = YAML.load_file(path)

    questions = data['questions'].map do |q|
      visibility = build_visibility(q['visibility'])

      case q['type']
      when 'text'
        TextQuestion.new(
          id: q['id'],
          text: q['text'],
          min_length: q['min_length'],
          max_length: q['max_length'],
          visibility: visibility
        )
      when 'boolean'
        BooleanQuestion.new(id: q['id'], text: q['text'], visibility: visibility)
      when 'radio'
        RadioQuestion.new(
          id: q['id'],
          text: q['text'],
          options: q['options'],
          preset: q['preset'],
          visibility: visibility
        )
      when 'checkbox'
        CheckboxQuestion.new(id: q['id'], text: q['text'], preset: q['preset'], visibility: visibility)
      when 'dropdown'
        DropdownQuestion.new(id: q['id'], text: q['text'], preset: q['preset'], visibility: visibility)
      else
        raise "Unknown question type: #{q['type']}"
      end
    end

    new(id: data['id'], title: data['title'], questions: questions)
  end

  def self.build_visibility(vis_data)
    return nil unless vis_data

    case vis_data['type']
    when 'value_check'
      ValueCheckCondition.new(question_id: vis_data['question_id'], value: vis_data['value'])
    when 'and'
      conditions = vis_data['conditions'].map { |c| build_visibility(c) }
      AndCondition.new(conditions: conditions)
    else
      nil # Or, Not no implementados por tiempo
    end
  end

  def visible_questions(responses)
    questions.select { |q| q.visible?(responses, id) }
  end
end