# frozen_string_literal: true

module UserSessions
  class ValidateAuhtorizationUser
    include Interactor

    def call
      context.fail!(errors: :unauthorized) unless find_user&.authenticate(context.session_params[:password])
    end

    private

    def find_user
      context.user = User.find(email: context.session_params[:email])
    end
  end
end
