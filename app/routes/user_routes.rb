# frozen_string_literal: true

class UserRoutes < Application
  helpers Validations

  post '/users' do
    user_params = validate_with!(NewUserContract)

    result = Users::CreateService.call(user_params: user_params[:user])

    if result.success?
      status 201
    else
      error_response(result.user, 422)
    end
  end
end
