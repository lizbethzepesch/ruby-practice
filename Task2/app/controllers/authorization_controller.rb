class AuthorizationController < ApplicationController
  def new
  end

  def create
    user = Users::Signin.call(params)
    session[:user_id] = user.id
    flash.now[:info] = 'Logged in successfully'
    redirect_to user_page_path
  rescue ServiceError => e
    flash.now[:alert] = e.message
    render :new
  end


  def omniauth
    @user = User.create_from_omniauth(auth)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_page_path
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
