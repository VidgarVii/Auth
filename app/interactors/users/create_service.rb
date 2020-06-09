# frozen_string_literal: true

module Users
  class CreateService
    include Interactor

    def call
      user_params = context.user_params

      user = User.new(
        name: user_params[:name],
        email: user_params[:email],
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation]
      )

      context.fail!(errors: user.errors) unless user.save
    end
  end
end
