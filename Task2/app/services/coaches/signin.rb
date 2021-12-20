module Coaches
  class Signin < ApplicationService

    def initialize(params)
      @params = params
    end

    def call
      find_user
      check_password
      @coach
    end

    private

    def find_user
      @coach = Coach.find_by(email: @params[:email])
      raise ServiceError, "Invalid email or password" if @coach.nil?
    end

    def check_password
      raise ServiceError, "Invalid email or password" if @coach.authenticate(@params[:password]) == false
    end
  end

end
