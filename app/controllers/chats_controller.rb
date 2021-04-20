class ChatsController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :authenticate_user!,only: [:show]
  def show
   if User.exists?(params[:id])
       @user = User.find(params[:id])
       if @user.id != current_user.id
        rooms = current_user.user_rooms.pluck(:room_id)
        user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

        if user_rooms.nil? 
          @room = Room.new
          @room.save
          UserRoom.create(user_id: @user.id, room_id: @room.id)
          UserRoom.create(user_id: current_user.id, room_id: @room.id)
        else
          @room = user_rooms.room
        end
          @chats = @room.chats.order("created_at DESC")
          @chat = Chat.new(room_id: @room.id)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end   
    
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    if @chat.image.attached?
      @image = url_for(@chat.image)
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :room_id, :image)
  end

end
