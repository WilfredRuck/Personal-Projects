Rails.application.routes.draw do
  
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users, :controllers => { registrations: 'registrations' }
  root "chatroom#index"

  get '/', to: 'chatroom#index'
  post '/chatroom/:id', to: 'messages#create'
  
  resources :chatroom
end
