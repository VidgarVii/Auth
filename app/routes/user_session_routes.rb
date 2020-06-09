# frozen_string_literal: true

class UserSessionRoutes < Application
  helpers Validations

  post '/' do
    content_type :json

    session_params = validate_with!(SessionParamsContract)

    result = UserSessions::CreateService.call(session_params: session_params.to_h)

    if result.success?
      token = JwtEncoder.encode(uuid: result.user_session.uuid)

      status 201
      json({ meta: { token: token } })
    else
      status 401
      json(error_response(result.errors))
    end
  end

end
