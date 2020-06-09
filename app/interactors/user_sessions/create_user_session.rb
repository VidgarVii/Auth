# frozen_string_literal: true

module UserSessions
  class CreateUserSession
    include Interactor

    def call
      session = UserSession.new

      if session.valid?
        context.user_session = context.user.add_session(session)
      else
        context.fail!(errors: session.errors)
      end
    end
  end
end
