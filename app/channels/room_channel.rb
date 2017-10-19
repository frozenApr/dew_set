class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    speak_user.messages.create!(content: data['message'], room_id: data['room_id'], to_user_id: data['to_user_id'])
  end
end
