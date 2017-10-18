class ChatroomController < ApplicationController

	def index
		if current_user
			@chat_rooms = Chatroom.all
			@user = current_user
			@myChats = Chatroom.where(user_id: @user.id)
		end
	end

	def new
		@chat_room = Chatroom.new
	end

	def create
		@chat_room = current_user.chatrooms.build(chat_room_params)
	    @chat_room.user_id = current_user.id
	    
	    if @chat_room.save
	    	flash[:success] = 'ChatBox added!'
	    	redirect_to root_path
	    else
	    	flash.now[:alert] = 'Please enter a title.'
	    	flash.discard
	    	render 'new'
	    end
	end

	def show
		@message = Message.new
		@chatroom = Chatroom.includes(:messages).find_by(id: params[:id])
		@chatroom_ids = Chatroom.includes(:messages).pluck(:user_id).uniq
		@chatroomUsers = Array.new
		@chatroom_ids.each do |id|
			@chatroomUsers.push(User.find_by(id: id).username)
		end
		flash[:username] = current_user.username
	end


	private

	def chat_room_params
		params.require(:chatroom).permit(:title)
	end

end
