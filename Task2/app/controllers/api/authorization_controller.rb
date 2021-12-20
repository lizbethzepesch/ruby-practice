module Api
  class AuthorizationController < ::ApiController
    before_action :authorize_request, except: :login

    def login
      @user = User.find_by(email: params[:email])

      if @user.present? && @user.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        render json: { token: token, name: @user.name }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

    private

    def login_params
      params.permit(:email, :password)
    end

  end
end
