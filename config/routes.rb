Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendances
    resources :events_picture, only: [:create]
  end
  root to: "events#index"
  resources :users, only: [:show, :edit , :update] do
    resources :avatars, only: [:create]
  end
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
