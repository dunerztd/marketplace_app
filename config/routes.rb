Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  root to: 'welcome#index'
  devise_for :users
  resources :teachers
  resources :users

end
