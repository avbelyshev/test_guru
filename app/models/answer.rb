class Answer < ApplicationRecord
  MAX_ANSWERS_TO_QUESTION = 4

  belongs_to :question, counter_cache: true

  validates :body, presence: true
  validate :answers_count_to_question

  scope :correct, -> { where(correct: true) }

  def answers_count_to_question
    if question.answers_count >= MAX_ANSWERS_TO_QUESTION
      errors.add(:question, 'Превышено максимальное количество ответов на вопрос')
    end
  end
end
