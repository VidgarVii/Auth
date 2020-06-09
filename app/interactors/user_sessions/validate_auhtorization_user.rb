# frozen_string_literal: true

module UserSessions
  class ValidateAuhtorizationUser
    include Interactor

    def call
      context.fail(:unauthorized) unless find_user&.authenticated(context.user_params.password)
    end

    private

    def find_user
      User.where(
        email: context.email,
        password: context.password
       )
    end
  end
end
