class AuthRoutes < Application
  namespace '/v1' do
    post '/users' do
      content_type :json

      result = NewUserContract.new.call(JSON.parse(request.body.read))

      if result.success?
        User.create(result.to_h)
      else
        error 400, result.errors.to_h
      end

      private

      def user_params

      end
    end
  end
end
