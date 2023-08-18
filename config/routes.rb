Rails.application.routes.draw do
  resources :reports do
   resources :newcomments, only: [:new, :create]
  end
  devise_for :pc_users, controllers: {
    sessions: 'pc_users/sessions',
    registrations: 'pc_users/registrations'
  }
  get 'home/index'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")
   root "reports#index"
end
