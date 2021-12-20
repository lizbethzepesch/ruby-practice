class UserMailer < ApplicationMailer
  default from: 'MentalClinic@gmail.com'

  def new_registration_email(user)
    @user = user
    @token = @user.signed_id(purpose: 'sign_up_verification', expires_in: 15.minutes)
    mail(to: @user.email, subject: "Verify your email!")
  end

end
