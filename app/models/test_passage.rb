class TestPassage < ApplicationRecord
  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_current_question

  def accept!(answer_ids)
    self.correct_answers += 1 if right_answer?(answer_ids)

    save!
  end

  def number_of_questions
    test.questions.count
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def right_answers_percent
    (correct_answers / number_of_questions) * 100
  end

  def completed?
    current_question.nil?
  end

  def passed_successfully?
    true if right_answers_percent >= SUCCESS_RATE
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_current_question
    self.current_question = next_question
  end

  def right_answer?(answer_ids)
    right_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def right_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
