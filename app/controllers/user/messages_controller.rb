class User::MessagesController < ApplicationController
  def index
    # バリデーションに失敗した時画面更新の対策
    redirect_to user_room_path(params[:room_id])
  end

  def create
    @message = Message.new(message_params)
    room = Room.find(params[:room_id])
    if @message.save
      @message.user_create_notification_message!(current_user, room.company_id, @message.id)
      respond_to do |format|
        format.html {redirect_to request.referrer}
        format.js
      end
      redirect_to user_room_path(params[:room_id])
    else
      @room = Room.find(params[:room_id])
      @messages = Message.where(room_id: params[:room_id]).order(created_at: :desc) # 新しい順で部屋にある全てのメッセージを取得する
      render 'user/rooms/show' # セーブできなかったときは、showページをrender
    end
  end

  private

  def message_params
    # mergeは、StrongParamaterに要素を追加するメソッド
    params.require(:message).permit(:body).merge(room_id: params[:room_id], user_id: current_user.id)
  end
end
