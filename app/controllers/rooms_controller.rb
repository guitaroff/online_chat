class RoomsController < ApplicationController
  before_action :set_current_user, only: [:index, :show]

  def index
    @rooms = Room.all
    @new_room = Room.new
  end

  def show
    @room = Room.find_by!(title: params[:title])
    @messages = @room.messages
    @new_message = current_user.messages.build
  end

  def create
    @new_room = current_user.rooms.create!(title: room_params[:title])
    @new_room.broadcast_append_to :rooms
  end

  private

  def room_params
    params.require(:room).permit(:title)
  end
end
