class Company::RoomsController < ApplicationController
  def index
    @rooms = Room.where(company_id: current_company)
  end

  def show
    @room = Room.find(params[:id]) # Roomに関する商法
    @message = Message.new # Form用のからのMessage
    @messages = Message.where(room_id: params[:id]).order(created_at: :desc) # 新しい順で部屋にある全てのメッセージを取得する
  end
end
