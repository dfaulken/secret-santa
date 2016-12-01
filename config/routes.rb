Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i(destroy index) do
    collection do
      post :claim
      get  :manage
      post :register
    end
  end
end
