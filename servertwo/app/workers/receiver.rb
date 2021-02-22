require 'sneakers'

class Processor
    include Sneakers::Worker
    from_queue :queue_msg

    def work(msg)
        Received.create!(title:'receiver', text:msg, user_id:1)
        # binding.pry
    end
end


# to run the single file
# sneakers work Processor --require app/workers/recv.rb
# bundle exec rake sneakers:run
# BG active file run
# rake sneakers:run
# rake rabbitmq:setup
# WORKER=Processor rake sneakers:run