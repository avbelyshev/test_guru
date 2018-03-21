class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_answers += 1 if right_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def right_answer?(answer_ids)
    right_answers_count = right_answers.count

    (right_answers_count == right_answers.where(id: answer_ids).count) &&
      right_answers_count == answer_ids.count
  end

  def right_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
