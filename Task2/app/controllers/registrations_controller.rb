class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = Users::Signup.call(user_params)
    if params[:user][:agree] == "on"
      UserMailer.new_registration_email(@user).deliver_now
      session[:user_id] = @user.id
      render :create
    end
  rescue ServiceError => e
    flash.now[:alert] = e.message
    render :new
  end

  def edit
    @problems = Problem.all
    @user = User.find_signed!(params[:token], purpose: 'sign_up_verification')
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: 'Your token has expired. Please try again.'
  end

  def update
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
    @problems = Problem.all
    if @user.update(update_params)
      params[:user][:problems]&.each do |problem|
        @problems.each do |data|
          if problem == data[:name]
            if @user.problems.find_by(name: data[:name]) == nil
              @user.problems << data
            end
          end
        end
      end
      redirect_to user_page_path
    else
      render :edit
    end
  end

  def resend
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
    UserMailer.new_registration_email(@user).deliver_now
    render :create
  end

  def destroy
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
    session[:user_id] = nil
    @user.destroy
    redirect_to sign_up_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:avatar_user, :age, :gender)
  end
end
