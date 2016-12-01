Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: :index do
    member do
      post :approve
      post :toggle_admin
    end
    collection do
      post :claim
      get  :manage
      post :register
    end
  end
end
