Rails.application.routes.draw do

  root 'art_labels#index'

  resources :art_labels, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:index, :new, :create, :show]
  end


  devise_for :users


end
