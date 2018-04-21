class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbackMailer.send_feedback(@admin, @feedback).deliver_now

      redirect_to root_path, notice: t('.success')
    else
      render :new, alert: t('.failure')
    end
  end

  private

  def set_admin
    @admin = User.find_by(type: 'Admin')
  end

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end
end
