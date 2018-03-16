class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    question = @test.questions.create(question_params)

    render plain: "Создан вопрос #{question.body}"
  end

  def destroy
    @question.delete

    render plain: 'Вопрос удален ('
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
