# frozen_string_literal: true

class UserSessionRoutes < Application
  helpers Validations

  post '/' do
    session_params = validate_with!(SessionParamsContract)

    result = UserSessions::CreateService.call(session_params: session_params.to_h)

    if result.success?
      token = JwtEncoder.encode(uuid: result.session.uuid)

      status 201
      render json: { meta: { token: token } }
    else
      status 401
      error_response(result.session || result.errors)
    end
  end

end
