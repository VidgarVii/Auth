# frozen_string_literal: true
require_relative 'create_user_session'
require_relative 'validate_auhtorization_user'

module UserSessions
  class CreateService
    include Interactor::Organizer

    organize UserSessions::ValidateAuhtorizationUser,
             UserSessions::CreateUserSession
  end
end
