class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to user
      user = User.find(params[:follow_id])
      matching = User.find(params["follow_id"]).following?(current_user)
      if user = matching
        user = User.find(params[:follow_id])
        #chatroom作成
        chatroom = Chatroom.new
        chatroom.save
        #chatroom_user作成(current_user)
        chatroom_user = ChatroomUser.new
        chatroom_user.chatroom_id = chatroom.id
        chatroom_user.user_id = current_user.id
        chatroom_user.save!
        #chatroom_user作成(フォローされた側)
        chatroom_user = ChatroomUser.new
        chatroom_user.chatroom_id = chatroom.id
        chatroom_user.user_id = user.id
        chatroom_user.save!
      end
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user
    end
  end


  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user
      # user = User.find(params[:follow_id])
      # if user.chatroom_users.room_id = current_user.chatroom_users.room_id
      #     chatroom = Chatroom.where(id: current_user.chatroom_users.room_id)
      #     chatroom.destroy
      # end
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user
    end
  end

end
