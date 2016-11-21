Rails.application.routes.draw do
	get "/", to: "promotions#home"
	resources :promotions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
