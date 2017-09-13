Rails.application.routes.draw do

  # root 'art_labels#index'
  root 'static_pages#index'

  resources :art_labels, only: [:index, :show], to: 'static_pages#index' do
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
  end

  # resources :art_labels do
  #   resources :reviews, only: [:index, :new, :create, :show, :destroy]
  # end

  resources :art_labels, only: [:new, :create, :show, :destroy]

  namespace :api do
    namespace :v1 do
      resources :art_labels, only: [:index, :show, :create] do
        resources :reviews, only: [:index, :show]
      end
    end
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
