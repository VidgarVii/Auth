# frozen_string_literal: true

class AuthRoutes < Application
  helpers Auth

  post '/' do
    content_type :json

    result = Auth::FetchUserService.call(uuid: extracted_token['uuid'])

    if result.success?
      status 200
      json({meta: { user_id: result.user.id }})
    else
      status 403
      json(error_response(result.errors))
    end
  end
end
