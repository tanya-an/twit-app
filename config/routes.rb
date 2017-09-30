Rails.application.routes.draw do
	get '/auth/:provider/callback', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
  root to: "twitters#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
