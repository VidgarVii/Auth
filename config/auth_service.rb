# frozen_string_literal: true

class AuthService < Application
  namespace '/api/v1' do
    get '/user' do
      content_type :json

      Ad.all.to_json
    end

    post '/user' do
      content_type :json

      result = RecordingAd.call(ad_params: JSON.parse(request.body.read))

      if result.success?
        result.ad.to_json
      else
        error 400, result.errors.to_json
      end
    end
  end
end
