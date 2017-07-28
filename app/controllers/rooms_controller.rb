class RoomsController < ApplicationController
  def show
    # @topic = 100
    @current_id = 1000
    @room_id = "my_room"
    @messages = Message.all
  end
end
