module Api
  class RegistrationController < ::ApiController
    skip_before_action :verify_authenticity_token

    def registration
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end

    end

    private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

  end
end
