Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  resources :users, only: [:new, :index, :show, :edit, :update]
  get "/homes/about" => "homes#about", as: "about"
  get 'users' => 'users#index'
  patch "/books" => "books#create"
  delete '/books' => 'books#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
