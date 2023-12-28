module Api
  module V1
    class BaseController < ApplicationController
      protect_from_forgery with: :null_session

      def set_guest_user!
        @guest_user ||= User.find_by!(email: 'guest@example.com')
      end

      private

      def render_not_found
        render json: { errors: ['Запись не найдена'] }, status: :not_found
      end
    end
  end
end
