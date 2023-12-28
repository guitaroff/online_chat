module Api
  module V1
    class RoomsController < BaseController
      def index
        @rooms = Room.all
        render json: @rooms, status: :ok
      end
    end
  end
end
