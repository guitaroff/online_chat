Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'

  resources :rooms, only: [:index, :create, :show], param: :title
  resources :messages, only: :create

  namespace :api do
    namespace :v1 do
      resources :rooms, only: :index
      resources :messages, only: :create
    end
  end
end
