module Coaches
  class Signup < ApplicationService

    def initialize(params)
      @params = params
      @coach = Coach.new(@params)
    end

    def call
      save
    end

    private

    def save
      @coach.save
      raise ServiceError, @coach.errors.full_messages if @coach.invalid?

      @coach
    end

  end
end
