class CoachMailer < ApplicationMailer
  default from: 'MentalClinic@gmail.com'

  def varify_email(coach)
    @coach = coach
    @token = @coach.signed_id(purpose: 'become_coach_update', expires_in: 15.minutes)
    mail(to: @coach.email, subject: "Verify your email!")
  end

end
