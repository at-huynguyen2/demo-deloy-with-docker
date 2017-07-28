class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_"+params[:roomId].to_s
  end

  def receive(data)
    binding.pry
    ActionCable.server.broadcast("chat_#{params[:room_id]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # Message.create! content: data['message']
    ActionCable.server.broadcast 'room_channel_'+params[:roomId].to_s, message: data['message']
  end
end
