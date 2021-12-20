class AuthorizationCoachController < ApplicationController
  def new
  end

  def create
    coach = Coaches::Signin.call(params)
    session[:coach_id] = coach.id
    flash.now[:info] = 'Logged in successfully'
    redirect_to coach_page_path
  rescue ServiceError => e
    flash.now[:alert] = e.message
    render :new
  end


  def destroy
    session[:coach_id] = nil
    redirect_to root_path
  end
end
