Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :create, :index, :show, :edit]
  get "/homes/about" => "homes#about", as: "about"
  get "/homes/index" => "homes#index", as: "index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
