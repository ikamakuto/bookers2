Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books
  resources :users, only: [:show, :edit, :update]
  resources :profile_image, only: [:new, :create, :index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users' => 'users#index'
  get 'home/about' => 'layouts#about'
  delete '/books' => 'books#destroy'
  get 'users/signup' => 'users#new'
end
