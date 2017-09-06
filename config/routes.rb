Rails.application.routes.draw do

  root 'art_labels#index'

  resources :art_labels, only: [:index, :new, :create, :show]

  devise_for :users


end
