class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :check_timer, only: :update

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)

      if @test_passage.passed_successfully?
        @test_passage.update(passed: true)
        @badges = BadgesReceiver.new(@test_passage).get_badges
        if @badges.present?
          current_user.badges.push(@badges)
          flash[:notice] = t('.badge')
        end
      end
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    service = GistQuestionService.new(question)
    result = service.call

    gist_link = helpers.link_to('Gist', result.html_url, target: :blank)

    if service.gist_created?
      current_user.gists.create(question: question, gist_url: result.html_url)
      flash_options = { notice: t('.success', gist_link: gist_link) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_timer
    if @test_passage.test.time_limit_present? && @test_passage.time_over?
      redirect_to result_test_passage_path(@test_passage)
    end
  end
end
