Chippy::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "static_pages/home"

  get "static_pages/team"

  get "static_pages/adventures"

  get "static_pages/gallery"

# the root URL for the site
  root "static_pages#home"


  resources :products do

    resource :basket

  end

  resources :orders


end
