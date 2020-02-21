Rails.application.routes.draw do
  get 'events_picture/create'
  devise_for :users
  resources :events do
    resources :attendances
    resources :events_picture, only: [:create]
  end
  root to: "events#index"
  resources :users, only: [:show, :edit , :update]
  
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
