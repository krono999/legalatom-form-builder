require 'spec_helper'

RSpec.describe "Visibility conditions" do
  let(:personal_form) { Questionnaire.from_yaml('config/personal_information.yaml') }
  let(:situation_form) { Questionnaire.from_yaml('config/about_the_situation.yaml') }
  let(:responses) { YAML.load_file('responses/user_response.yaml') }

  it "shows the alias question when have_alias is true" do
    alias_question = personal_form.questions.find { |q| q.id == "alias_name" }
    expect(alias_question.visible?(responses, "personal_information")).to be true
  end

  it "hides the alias question when have_alias is false" do
 
    modified_responses = responses.merge({
      "personal_information" => responses["personal_information"].merge("have_alias" => false)
    })
    alias_question = personal_form.questions.find { |q| q.id == "alias_name" }
    expect(alias_question.visible?(modified_responses, "personal_information")).to be false
  end

  it "hides the state dropdown because live_in_us is false" do
    state_question = situation_form.questions.find { |q| q.id == "state" }
    expect(state_question.visible?(responses, "about_the_situation")).to be false
  end

  it "would show the state dropdown if live_in_us true and which_situation dv" do

    modified_responses = responses.merge({
      "about_the_situation" => responses["about_the_situation"].merge(
        "live_in_us" => true, "which_situation" => "dv"
      )
    })
    state_question = situation_form.questions.find { |q| q.id == "state" }
    expect(state_question.visible?(modified_responses, "about_the_situation")).to be true
  end
end