Rails.application.routes.draw do
  get 'items/index'
  get 'furimas/index'
  devise_for :users
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
end
