Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :system do
    resources :load_balancer_entities
    resources :remote_scripts
  end

  get '/system/script_executor' => 'system/script_executor#index'
  post '/system/script_executor' => 'system/script_executor#execute'

  root 'system#index'
end
