Rails.application.routes.draw do
  get 'home/index'
	get '/auth/:provider/callback', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	resources :twitts
  root to: "twitts#index"
end
