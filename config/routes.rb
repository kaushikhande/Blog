
require 'sidekiq/web'
Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :articles
  
  root 'welcome#index'
  
  mount Sidekiq::Web, at: "/sidekiq"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
