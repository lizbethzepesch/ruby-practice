class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  before_action :set_current

  def set_current
    Current.coach = Coach.find_by(id: session[:coach_id]) if session[:coach_id]
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
  end

  def require_coach_logged_in!
    redirect_to sign_in_coach_path, alert: 'You must be signed in' if Current.coach.nil?
  end

end
