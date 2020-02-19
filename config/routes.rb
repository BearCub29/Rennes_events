Rails.application.routes.draw do
  devise_for :users
  resources :events 
  root to: "events#index"
  resources :users, only: [:show, :edit , :update]
  resources :attendances
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
