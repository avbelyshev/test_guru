class FeedbackMailer < ApplicationMailer
  def send_feedback(admin, feedback)
    @admin = admin
    @feedback = feedback

    mail to: @admin.email, from: @feedback.user.email, subject: @feedback.title
  end
end
