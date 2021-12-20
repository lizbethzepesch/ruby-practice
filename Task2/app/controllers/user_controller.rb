class UserController < ApplicationController
  before_action :require_user_logged_in!

  def new
    @coach = Coach.find_by(id: params[:coach_id])
    @invite = Invitation.find_by(user_id: Current.user.id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def finish
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user = Current.user
    @problems = Problem.all
  end

  def update
    @user = Current.user
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
      UserNotification.create(body: "You changed your profile settings", status: 1, user_id: @user.id)
      flash[:info] = "You updated your profile info!"
      redirect_to user_page_path
    else
      render :edit
    end
  end

  def password_edit
    @user = Current.user
  end

  def password_update
    @user = Current.user
    if BCrypt::Password.new(Current.user.password_digest) == params[:user][:old_password]
      if Current.user.update(password_params)
        UserNotification.create(body: "You changed your password settings", status: 1, user_id: @user.id)
        flash[:info] = "You changed your password!"
        redirect_to user_page_path
      else
        render :password_edit
      end
    else
      flash[:error] = "You entered invalid password!"
      render :password_edit
    end
  end

  def dashboard
    @user = Current.user
    @problems = @user.problems
    @notifications = @user.user_notifications.order('created_at desc')
    @invite = @user.invitations.first
    @recommendations = @user.recommendations.order(:status)
    @total_hours = get_total_time_for_techniques(@recommendations)
    @current_hours = get_current_time_for_techniques(@recommendations)
    @total_competed_techniques = @user.recommendations.where(status: 'compeleted').count
    @total_in_progress_technique = @user.recommendations.where(status: 'in_progress').count
  end

  def user_technique_detail
    @user = Current.user
    @technique = Technique.find_by_id(params[:technique_id])
    @recommendation = Recommendation.find_by(user_id: @user.id, technique_id: params[:technique_id])
    next_step = params[:step_id].to_i
    if next_step < @technique.total_steps
      @recommendation.update(step: next_step+1, status: 1)
      @recommendation.update(started_at: Time.zone.now) if @recommendation.started_at == nil
      @step = Step.find_by(number: next_step+1)
    else
      @step = Step.find_by(number: next_step)
    end
  end

  def restart
    @user = Current.user
    @recommendation = Recommendation.find_by(user_id: @user.id, technique_id: params[:technique_id]).update(step: 0, status: 0, started_at: Time.zone.now, ended_at: nil)
    redirect_to user_technique_detail_path(technique_id: params[:technique_id], step_id: 0)
  end


  def coaches_page
    @user = Current.user
    @problems = Problem.all
    @coaches = Coach.all
    @invite = Invitation.find_by(user_id: @user.id)
    if params[:search] != nil
      search_coach(params[:search])
    else
      if params[:filter].present?
        filter_expertise(params[:filter][:problems])
        filter_users_count(params[:filter][:users])
        filter(params[:filter][:gender])
        filter(params[:filter][:age])
      end
    end
  end

  def send_invintation
    @user = Current.user
    @coach = Coach.find_by_id(params[:coach_id])
    if Invitation.find_by(user_id: @user.id) == nil
      Invitation.create(coach_id: @coach.id, user_id: @user.id, status: 0)
      UserNotification.create(body: "You have sent an invitation to coach #{@coach.name}", user_id: @user.id, coach_id: @coach.id, status: 1)
      CoachNotification.create(body: "You have received an invitation to become a coach from a user #{@user.name}", coach_id: @coach.id, user_id: @user.id, status: 1)
      flash[:info] = "You have sent an invitation to coach!"
      redirect_to user_dashboard_page_path
    end
  end

  def cancel_invite
    @invite = Invitation.find_by_id(params[:invite_id])
    UserNotification.create(body: "You have canceled an invitation to coach #{@invite.coach.name}", user_id: @invite.user.id, coach_id: @invite.coach.id, status: 1)
    flash[:info] = "You have ended cooperation with this coach!"
    @invite.destroy
    redirect_to user_dashboard_page_path
  end

  def modal_ask_form
    @coach = Invitation.find_by(user_id: Current.user.id, status: 1).coach
    @invite = Invitation.find_by(user_id: Current.user.id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def end_cooperation
    @invite = Invitation.find_by_id(params[:invite_id])
    UserNotification.create(body: "You have ended cooperation with coach #{@invite.coach.name}", user_id: @invite.user.id, coach_id: @invite.coach.id, status: 1)
    flash[:info] = "You have ended cooperation with this coach!"
    @invite.destroy
    redirect_to user_dashboard_page_path
  end

  def my_techniques
    @user = Current.user
    @invite = @user.invitations.find_by(status: 1)
    @recommendations = @user.recommendations
  end


  def like
    @user = Current.user
    if Rating.find_by(technique_id: params[:technique_id], user_id: @user.id) == nil
        Rating.create(technique_id: params[:technique_id], user_id: @user.id, like: 1, dislike: 0)
        UserNotification.create(body: "You like your Technique", user_id: @user.id, status: 1)
    end
    recommendation = Recommendation.find_by(technique_id: params[:technique_id], user_id: @user.id)
    recommendation.update(status: 2)
    recommendation.update(ended_at: Time.zone.now) if recommendation.ended_at == nil
    flash[:info] = "You like Technique"
    redirect_to user_dashboard_page_path
  end

  def dislike
    @user = Current.user
    if Rating.find_by(technique_id: params[:technique_id], user_id: @user.id) == nil
        Rating.create(technique_id: params[:technique_id], user_id: @user.id, like: 0, dislike: 1)
        UserNotification.create(body: "You dislike your Technique", user_id: @user.id, status: 1)
    end
    recommendation = Recommendation.find_by(technique_id: params[:technique_id], user_id: @user.id)
    recommendation.update(status: 2)
    recommendation.update(ended_at: Time.zone.now) if recommendation.ended_at == nil
    flash[:info] = "You dislike Technique"
    redirect_to user_dashboard_page_path
  end

  private

  def search_coach(param)
    @coaches = Coach.search(param)
  end

  def filter_expertise(param)
    if param.present?
      @coaches = Problem.find_by(name: param).coaches
    end
  end

  def filter(param)
    param&.each do |data|
      @coaches = @coaches.where(data)
    end
  end

  def filter_users_count(param)
    if param.present?
      temp = @coaches
      array = []
      temp&.each do |coach|
        count = coach.invitations.where(status: 1).count
        param.each do |user_total|
          if user_total == '5' and count <= 5
            array << coach.id
          end
          if user_total == '5-10' and count > 5 and count <= 10
            array << coach.id
          end
          if user_total == '10-20' and count > 10 and count <= 20
            array << coach.id
          end
          if user_total == '20' and count > 20
            array << coach.id
          end
        end
      end
      array.uniq!
      @coaches = @coaches.where(id: array)
    end
  end

  def get_total_time_for_techniques(techniques)
    total_hours = 0
    techniques&.each do |t|
      if t.status == 'compeleted'
        total_hours += (t.ended_at - t.started_at)/60/60
      end
    end
    total_hours = total_hours.round
  end

  def get_current_time_for_techniques(techniques)
    current_hours = 0
    techniques&.each do |t|
      if t.status == 'in_progress'
        current_hours += (Time.zone.now - t.started_at)/60/60
      end
    end
    current_hours = current_hours.round
  end

  def update_params
    params.require(:user).permit(:name, :email, :avatar_user, :about, :age, :gender)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
