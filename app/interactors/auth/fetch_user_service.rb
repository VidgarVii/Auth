# frozen_string_literal: true

module Auth
  class FetchUserService
    include Interactor

    def call
      if context.uuid.blank? || session.blank?
        context.fail!(errors: I18n.t(:forbidden, scope: 'services.auth.fetch_user_service'))
      end

      context.user = session.user
    end

    private

    def session
      @session ||= UserSession.find(uuid: context.uuid)
    end
  end
end
