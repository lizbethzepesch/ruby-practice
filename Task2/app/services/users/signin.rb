module Users
  class Signin < ApplicationService

    def initialize(params)
      @params = params
    end

    def call
      find_user
      check_password
      @user
    end

    private

    def find_user
      @user = User.find_by(email: @params[:email])
      raise ServiceError, "Invalid email or password" if @user.nil?
    end

    def check_password
      raise ServiceError, "Invalid email or password" if @user.authenticate(@params[:password]) == false
    end
  end
  
end
