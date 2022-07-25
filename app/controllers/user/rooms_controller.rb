class User::RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :create]
  def index
    @rooms = Room.where(user_id: current_user).order(updated_at: :desc) #送ってきた日時を新しい順で取得する
  end

  def create
    # ユーザーと企業IDが同じレコードをRoomから検索し、なければ部屋を作成する。あればその部屋番号を返す。
    @room = Room.find_or_create_by(user_id: current_user.id, company_id: params[:company_id])
    redirect_to user_room_path(@room)
  end

  def show
    @room = Room.find(params[:id]) # Roomに関する商法
    @message = Message.new # Form用のからのMessage
    @messages = Message.where(room_id: params[:id]).order(created_at: :desc) #送ってきた日時を新しい順で取得する
  end
end
