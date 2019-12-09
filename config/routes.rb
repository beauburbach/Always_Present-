Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  root to: 'courses#home'
  get 'login', to: 'courses#new'
  post 'login', to: 'courses#create_user'
  get 'home', to: 'courses#home'

  # Routes for the Course resource:

  # CREATE
  match("/insert_course", { :controller => "courses", :action => "create", :via => "post"})
          
  # READ
  match("/courses", { :controller => "courses", :action => "index", :via => "get"})
  
  match("/courses/:id_from_path", { :controller => "courses", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_course/:id_from_path", { :controller => "courses", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_course/:id_from_path", { :controller => "courses", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the User resource:

  # CREATE
  match("/insert_user", { :controller => "users", :action => "create", :via => "post"})
          
  # READ
  match("/users", { :controller => "users", :action => "index", :via => "get"})
  
  match("/users/:id_from_path", { :controller => "users", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_user/:id_from_path", { :controller => "users", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_user/:id_from_path", { :controller => "users", :action => "destroy", :via => "get"})

  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
