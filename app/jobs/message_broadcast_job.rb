class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # def perform(*args)
  #   # Do something later
  # end
  def perform(message)
    ActionCable.server.broadcast(
      'room_channel',
      message: render_message(message),
      sent_by: 'Huy-Nguyen',
      body: 'chat app'
    )
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
    end
end
