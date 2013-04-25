HelloRubyTuesday::Application.routes.draw do

  ActiveAdmin.routes(self) rescue nil

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  resources :users do
    member do
      get 'links_index'
    end
  end
  resources :links
 
  root :to => 'static_pages#home'
  
  as :user do
    get '/signup' => 'users#new'
    get '/signin' => 'devise/sessions#new'
    get '/signout' => 'devise/sessions#destroy'
  end

end

