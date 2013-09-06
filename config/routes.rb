SpeedingTicketNew::Application.routes.draw do

	get 'signup', to: 'technicians#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'

  	resources :technicians
  	resources :sessions
  	resources :users
  	resources :assets
  
  	root to: 'technicians#index'

end
