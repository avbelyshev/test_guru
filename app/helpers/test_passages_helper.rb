module TestPassagesHelper
  def result_color(test_passage)
    test_passage.passed_successfully? ? 'success' : 'fail'
  end

  def result_message(test_passage)
    correct_answers = test_passage.correct_answers

    "#{correct_answers} correct #{'answer'.pluralize(correct_answers)}
    to #{test_passage.number_of_questions} questions (#{test_passage.right_answers_percent}%).
    The test is #{test_passage.passed_successfully? ? 'passed successfully' : 'failed'}!"
  end
end
