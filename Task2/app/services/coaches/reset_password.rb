module Coaches
  class ResetPassword < ApplicationService

    def initialize(params)
      @params = params
    end

    def call
      find_coach
      @coach
    end

    private

    def find_coach
      @coach = Coach.find_by(email: @params[:email])
      raise ServiceError, "Invalid email!" if @coach.nil?
    end

  end
end
