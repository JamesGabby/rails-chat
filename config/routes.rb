Rails.application.routes.draw do
  resources :users, only: [:show, :index]
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  mount ActionCable.server, at: '/cable'
end
