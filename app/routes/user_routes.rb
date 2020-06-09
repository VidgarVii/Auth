# frozen_string_literal: true

class UserRoutes < Application
  helpers Validations

  post '/' do
    user_params = validate_with!(NewUserContract)

    result = Users::CreateService.call(user_params: user_params[:user])

    if result.success?
      status 201
    else
      status 422
      json(error_response(result.errors))
    end
  end
end
