class Company::RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index
    @rooms = Room.where(company_id: current_company).order(updated_at: :desc) #送ってきた日時を新しい順で取得する
  end

  def show
    @room = Room.find(params[:id]) # Roomに関する商法
    @message = Message.new # Form用のからのMessage
    @messages = Message.where(room_id: params[:id]).order(created_at: :desc) #送ってきた日時を新しい順で取得する
  end
end
