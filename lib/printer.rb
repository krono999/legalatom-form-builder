class Printer
  def self.print(questionnaires, responses)
    questionnaires.each do |q|
      puts q.title.upcase
      visible = q.visible_questions(responses)
      visible.each_with_index do |question, idx|
        puts "#{idx + 1}. #{question.text}"
        response_value = responses.dig(q.id, question.id)

        # Imprimir descripción extra (min/max)
        extra = question.respond_to?(:description) ? question.description : nil
        puts extra if extra && !extra.empty?

        # Imprimir opciones/render
        puts question.render(response_value)

        # Imprimir comentario de visibilidad si aplica (como en el ejemplo)
        if question.visibility && question.visible?(responses, q.id)
          if question.visibility.is_a?(ValueCheckCondition)
            puts "<Visible> #{question.visibility.question_id}: #{question.visibility.expected_value}"
          elsif question.visibility.is_a?(AndCondition)
            puts "<AND Visible> ..."
          end
        end
      end
      puts ""
    end
  end
end