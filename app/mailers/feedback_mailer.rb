class FeedbackMailer < ApplicationMailer
  before_action :set_admin

  def send_feedback(feedback)
    @feedback = feedback

    mail to: @admin.email, from: @feedback.user.email, subject: @feedback.title
  end

  private

  def set_admin
    @admin = User.find_by(type: 'Admin')
  end
end
