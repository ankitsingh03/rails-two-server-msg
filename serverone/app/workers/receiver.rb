require 'sneakers'

class Processor
    include Sneakers::Worker
    from_queue :server_two_msg

    def work(msg)
        # binding.pry
        Received.create!(title:'receiver', text:msg, user_id:1)
        # binding.pry
    end
end
