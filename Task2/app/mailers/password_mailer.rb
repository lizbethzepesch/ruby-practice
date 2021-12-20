class PasswordMailer < ApplicationMailer
  default from: 'example.liza@gmail.com'
  def reset
    @token = params[:user].signed_id(purpose: 'reset_password_edit', expires_in: 15.minutes)
    mail(to: params[:user].email)
  end

  def reset_coach(coach)
    @coach = coach
    @token = @coach.signed_id(purpose: 'reset_password_coach_edit', expires_in: 15.minutes)
    mail(to: @coach.email, subject: "Reset Password")
  end
end
