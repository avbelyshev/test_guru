class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: [:new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to test_path(@question.test)
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
