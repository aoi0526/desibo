class Company::MessagesController < ApplicationController
  def index
    # バリデーションに失敗した時画面更新の対策
    redirect_to company_room_path(params[:room_id])
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to company_room_path(params[:room_id])
    else
      @room = Room.find(params[:room_id])
      @messages = Message.where(room_id: params[:room_id]).order(created_at: :desc) # 新しい順で部屋にある全てのメッセージを取得する
      render 'company/rooms/show' # セーブできなかったときは、showページをrender
    end
  end

  private

  def message_params
    # mergeは、StrongParamaterに要素を追加するメソッド
    params.require(:message).permit(:body).merge(room_id: params[:room_id], company_id: current_company.id)
  end
end
