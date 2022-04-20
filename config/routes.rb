Rails.application.routes.draw do
  get "home/about" => "homes#about", as: 'home_about'
  devise_for :users
  root to: "homes#top"
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  resources :books, only: [:new, :create, :index, :show, :edit, :update]
  resources :users, only: [:new, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end