module RabbitMQ
  extend self

  @mutex = Mutex.new

  def connection
    @mutex.synchronize do
      @connection ||= Bunny.new.start
    end
  end

  def consumer_channel
    Thread.current[:consumer_channel] ||=
      connection.create_channel(
        nil,
        Settings.rabbitmq.consumer_pool
      )
  end
end
