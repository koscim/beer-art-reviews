Rails.application.routes.draw do

  root 'art_labels#index'

  resources :art_labels, only: [:index, :new, :create, :show]


  devise_for :users

  resources :users, only: [:destroy]


  get 'admin' => 'admin#index'
end
