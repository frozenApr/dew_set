class RoomsController < ApplicationController
  def show
    @room = current_user.rooms.find_by(to_user_id: params[:to_user_id]) ||
            Room.find_by(to_user_id: current_user.id, user_id: params[:to_user_id]) ||
            current_user.rooms.create!(to_user_id: params[:to_user_id])
    @messages = @room.messages.includes(:from_user)
    @messages.unread.update_all(read: true)
  end
end
