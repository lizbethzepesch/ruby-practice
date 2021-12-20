class ResetPasswordCoachController < ApplicationController
  def new
  end

  def create
    @coach = Coaches::ResetPassword.call(params)
    PasswordMailer.reset_coach(@coach).deliver_now
    session[:coach_email] = @coach.email
    render :create
  rescue ServiceError => e
    flash.now[:alert] = e.message
    render :new
  end

  def edit
      @coach = Coach.find_signed!(params[:token], purpose: 'reset_password_coach_edit')
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_coach_path, alert: 'Your token has expired. Please try again.'
  end


  def update
    @coach = Coach.find_signed!(params[:token], purpose: 'reset_password_coach_edit')

    if @coach.update(password_params)
      session[:coach_email] = nil
      redirect_to sign_in_coach_path, notice: 'Your password was reset successfully. Please sign in'
    else
      render :edit
    end

  end

  def resend
    @coach = Coach.find_by(email: session[:coach_email])
    PasswordMailer.reset_coach(@coach).deliver_now if @coach.present?
    render :create
  end

  private

  def password_params
    params.require(:coach).permit(:password, :password_confirmation)
  end
end
