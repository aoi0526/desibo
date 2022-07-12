class User::RoomsController < ApplicationController

  def index
    @rooms = Room.where(user_id: current_user)
  end

  def create
    # ユーザーと企業IDが同じレコードをRoomから検索し、なければ部屋を作成する。あればその部屋番号を返す。
    @room = Room.find_or_create_by(user_id: current_user.id, company_id: params[:company_id])
    redirect_to user_room_path(@room)
  end

  def show
    @room = Room.find(params[:id]) # Roomに関する商法
    @message = Message.new # Form用のからのMessage
    @messages = Message.where(room_id: params[:id]).order(created_at: :desc) # 新しい順で部屋にある全てのメッセージを取得する
  end
end
