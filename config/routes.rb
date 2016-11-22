Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: :index do
    collection do
      post :register
      post :claim
    end
  end
end
