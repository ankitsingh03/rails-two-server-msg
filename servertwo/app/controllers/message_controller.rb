class MessageController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user!, except: [:index, :about]

  def index
  end

  def message
    puts current_user.inspect
    @messages = Message.all
  end

  def about
  end

  def create
    if params["my_data"] != ""
      Sent.create!(title:'sender', text:params["my_data"], user_id: current_user.id)
      Publisher.publish("server_two_msg", params["my_data"])
      redirect_to '/message'
    else
      redirect_to '/message'
    end
  end
  
end
