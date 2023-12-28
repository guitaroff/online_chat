module Api
  module V1
    class MessagesController < BaseController
      before_action :set_guest_user!, only: :create
      before_action :find_room!, only: :create

      def create
        @new_message = @guest_user.messages.create!(message_params)

        room = @new_message.room
        @new_message.broadcast_append_to room, target: "room_#{room.id}_messages", locals: { message: @new_message }

        render json: @new_message, status: :ok
      end

      private

      def message_params
        params.require(:message).permit(:body, :room_id)
      end

      def find_room!
        @room = Room.find_by!(id: message_params[:room_id])
      end
    end
  end
end
