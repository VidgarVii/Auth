module AdService
  class RpcClient
    extend Dry::Initializer[undefined: false]
    include RpcApi

    option :queue, default: proc { create_queue }

    private

    def create_queue
      channel = RabbitMq.channel
      channel.queue('user_ids', durable: true)
    end

    def publish(payload, opts = {})
      @queue.publish(
        payload,
        opts.merge(
          persistent: true,
          app_id: 'auth'
        )
      )
    end
  end
end
