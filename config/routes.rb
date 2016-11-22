Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i(destroy index) do
    collection do
      post :claim
      get  :manage
      post :register
    end
  end
end
