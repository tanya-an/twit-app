Rails.application.routes.draw do
  get 'home/index'

	get '/auth/:provider/callback', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	resources :twitts
  #root to: "twitts#index"
  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
