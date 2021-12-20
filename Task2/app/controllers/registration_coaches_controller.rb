class RegistrationCoachesController < ApplicationController
  def new
    @coach = Coach.new
  end

  def create
    @coach = Coaches::Signup.call(coach_params)
    if params[:coach][:agree] == "on"
      CoachMailer.varify_email(@coach).deliver_now
      session[:coach_id] = @coach.id
      render :create
    end
  rescue ServiceError => e
    flash.now[:alert] = e.message
    render :new
  end

  def edit
    @problems = Problem.all
    @coach = Coach.find_signed!(params[:token], purpose: 'become_coach_update')
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: 'Your token has expired. Please try again.'
  end

  def update
    @coach = Coach.find_by(id: session[:coach_id]) if session[:coach_id]
    @problems = Problem.all
    if @coach.update(update_params)
      if params[:coach][:social_networks] && params[:coach][:social_networks] != ""
        params[:coach][:social_networks].each do |social_network|
          SocialNetwork.create(name: social_network, coach_id: @coach.id)
        end
      end
      params[:coach][:problems]&.each do |problem|
        @problems.each do |data|
          if problem == data[:name]
            if @coach.problems.find_by(name: data[:name]) == nil
              @coach.problems << data
            end
          end
        end
      end
      redirect_to coach_page_path
    else
      render :edit
    end
  end

  def destroy
    @coach = Coach.find_by(id: session[:coach_id]) if session[:coach_id]
    session[:coach_id] = nil
    @coach.destroy
    redirect_to become_coach_path
  end

  def resend
    @coach = Coach.find_by(id: session[:coach_id]) if session[:coach_id]
    CoachMailer.varify_email(@coach).deliver_now
    render :create
  end

  private

  def coach_params
    params.require(:coach).permit(:name, :email, :password, :password_confirmation)
  end

  def update_params
    params.require(:coach).permit(:avatar, :age, :gender, :education, :experience, :licenses)
  end

end
