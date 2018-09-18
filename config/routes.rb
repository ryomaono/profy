Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:edit,:update]
  root to: "top#index"
  resources :groups, onl: [:show,:edit, :update]

end
