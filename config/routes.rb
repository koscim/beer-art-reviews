Rails.application.routes.draw do

  root 'art_labels#index'

  resources :art_labels do
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
  end



  devise_for :users

  # resources :users, only: [:destroy]

  # get 'admin' => 'admin#index' do
  #   namespace :users, only: [:destroy]
  # end

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
end
