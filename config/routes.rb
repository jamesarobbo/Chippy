Chippy::Application.routes.draw do
 
  get "static_pages/home"

  get "static_pages/team"

  get "static_pages/adventures"

  get "static_pages/gallery"

# the root URL for the site
  root "static_pages#home"


  get "products/available_stock", to: "products#available_stock"
  

  resources :products do

    resource :basket

  end

  resources :orders

  
  match "orders/new/basket_update", to: "baskets#basket_update", via: [:get, :post], as: :basket_update









devise_for :admin_users, ActiveAdmin::Devise.config


  
  ActiveAdmin.routes(self)

  

  

  




end
