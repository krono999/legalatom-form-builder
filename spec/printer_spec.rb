require 'spec_helper'

RSpec.describe Printer do
  let(:questionnaires) do
    [
      Questionnaire.from_yaml('config/personal_information.yaml'),
      Questionnaire.from_yaml('config/about_the_situation.yaml')
    ]
  end

  let(:responses) { YAML.load_file('responses/user_response.yaml') }

  def captured_output
    original_stdout = $stdout
    $stdout = StringIO.new
    Printer.print(questionnaires, responses)
    $stdout.string
  ensure
    $stdout = original_stdout
  end

  it "includes the alias question since have_alias is true" do
    output = captured_output
    expect(output).to include("What is your alias?")
  end

  it "does not include the hidden state question" do
    output = captured_output
    expect(output).not_to include("What state do you live in?")
  end

  it "includes the country question because live_in_us is false" do
    output = captured_output
    expect(output).to include("What country do you live in?")
  end
end