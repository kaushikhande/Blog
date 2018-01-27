
require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  #devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :articles
  
  root 'welcome#index'
  
  mount Sidekiq::Web, at: "/sidekiq"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
