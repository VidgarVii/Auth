module AdService
  module RpcApi
    def publish_user_id(user_id)
      payload = { user_id: user_id }.to_json

      publish(
        payload,
        type: 'authentication'
      )
    end
  end
end
