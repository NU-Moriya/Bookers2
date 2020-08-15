Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  root :to => 'root#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:index, :show, :edit]
end
