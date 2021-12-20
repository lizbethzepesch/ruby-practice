module Users
  class ResetPassword < ApplicationService

    def initialize(params)
      @params = params
    end

    def call
      find_user
      @user
    end

    private

    def find_user
      @user = User.find_by(email: @params[:email])
      raise ServiceError, "Invalid email!" if @user.nil?
    end

  end
end
