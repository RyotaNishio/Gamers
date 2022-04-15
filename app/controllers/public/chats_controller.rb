class Public::ChatsController < ApplicationController
  def create
    @room = Room.find(params[:chat][:room_id])
    @chats = @room.chats
    @chat = current_user.chats.new(chat_params)
    if @chat.save
      @chat.room.create_notification_chat!(current_user, @chat.id)
      redirect_to request.referer
    else
      render :show
    end
  end

  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user: @user, room: rooms)

    unless user_rooms.nil?
      @room = user_rooms.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user: current_user, room: @room)
      UserRoom.create(user: @user, room: @room)
    end
    @chats = @room.chats
    @chat = Chat.new(room: @room)
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
