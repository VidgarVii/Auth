# frozen_string_literal: true

channel = RabbitMq.consumer_channel
queue = channel.queue('auth', durable: true)
exchange = channel.default_exchange
puts 'CONSUMER STARTED!'

def apply_authentication(payload)
  Auth::FetchUserService.call(uuid: JwtEncoder.decode(payload['uuid'])['uuid'])
end

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON(payload)
  puts payload
  result =
    case properties[:type]
    when 'authentication' then apply_authentication(payload)
    else
      puts 'The consumer cannot process this type of message!'
    end

  if result.success?
    client = AdService::RpcClient.new
    client.publish_user_id(result.user.id)

    exchange.publish(
      '',
      routing_key: properties.reply_to,
      correlation_id: properties.correlation_id
    )
  else
    puts result.errors
  end

  channel.ack(delivery_info.delivery_tag)
end
