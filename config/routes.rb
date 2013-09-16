SpeedingTicketNew::Application.routes.draw do

  resources :purchases

	root to: 'tickets#index'
	
	get 'signup', to: 'technicians#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'

  	resources :technicians
  	resources :sessions
  	resources :users do
  		resources :comments
  	end
  	resources :assets do
  		resources :comments
  	end
  	resources :tickets do
  		resources :comments
  	end
  	resources :purchases
  	resources :softwares

end
