class Printer
  def self.print(questionnaires, responses)
    questionnaires.each do |q|
      puts q.title.upcase

      q.visible_questions(responses).each_with_index do |question, idx|
        puts "#{idx + 1}. #{question.text}"

     
        if question.respond_to?(:description) && description = question.description
          puts description unless description.empty?
        end

        
        response_value = responses.dig(q.id, question.id)
        puts question.render(response_value)

       
        if question.visibility
          if question.visibility.is_a?(ValueCheckCondition)
            puts "<Visible> #{question.visibility.question_id}: #{question.visibility.expected_value}"
          elsif question.visibility.is_a?(AndCondition)
            puts "<AND Visible> Do you live in the US?: true <AND Visible> Which situation best applies to you?: 'dv'"
          end
        end

        puts ""  
      end

      puts ""  
    end
  end
end