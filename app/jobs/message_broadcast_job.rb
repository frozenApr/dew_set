class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(counter, message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message), counter: render_counter(counter),
                                                 to_user_id: message.to_user_id
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end

  def render_counter(counter)
    ApplicationController.renderer.render(partial: 'messages/counter', locals: { counter: counter })
  end
end
