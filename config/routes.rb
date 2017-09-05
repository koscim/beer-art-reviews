Rails.application.routes.draw do
  devise_for :users
  root 'art_labels#index'
  resources :art_labels
end
