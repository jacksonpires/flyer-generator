Rails.application.routes.draw do
  get 'home/index'

  resources :flyers
  resources :about, only: [:index]
  
  get 'about/clear'
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
