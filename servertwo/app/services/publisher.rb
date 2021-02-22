class Publisher
    def self.publish(queue_name, message = "")
        # event = channel.fanout("blog. posts")
        # event.publish(message)
        exchange = channel.default_exchange
        # event = channel.queue(queue_name, :exclusive => false, :auto_delete => true)
        exchange.publish(message, routing_key: "server_two_msg")
    end

    def self.channel
        @channel ||= connection.create_channel
    end

    def self.connection
        @connection ||= Bunny.new.tap do |connect|
            connect.start
        end
    end
end