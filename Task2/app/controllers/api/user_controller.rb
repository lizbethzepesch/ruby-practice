module Api
  class UserController < ::ApiController
    before_action :authorize_request

    def show
      @recommendations = @current_user.recommendations
      technique = []
      @recommendations.each { |rec| technique << rec.technique }
      if technique.present?
        render json: { user: @current_user, recommendations: technique }, status: :ok
      else
        render json: { user: @current_user, recommendations: "Not recommendations yet." }, status: :ok
      end
    end
  end
end
