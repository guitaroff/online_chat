class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::NotNullViolation, with: :render_invalid_error
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_invalid_error
    flash[:error] = 'Не заполнены необходимые поля'
    redirect_to root_path
  end

  def render_not_found
    flash[:error] = 'Запись не найдена'
    redirect_to root_path
  end
end
