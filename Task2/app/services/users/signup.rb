module Users
  class Signup < ApplicationService

    def initialize(params)
      @params = params
      @user = User.new(@params)
    end

    def call
      save
    end

    private

    def save
      @user.save
      raise ServiceError, @user.errors.full_messages if @user.invalid?

      @user
    end

  end
end
