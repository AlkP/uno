Uno::Application.routes.draw do

  root 'main#index'
  get "index" => "main#pizza", :as => "index"
  get "call" => "main#call", :as => "call"
  post "call" => "main#pizza", :as => "send_call"

  get "variants/add_dish/:id" => "variants#add_dish"
  get "variants/add_product/:id" => "variants#add_product"
  post "variants/add_product/:id" => "variants#create_product"
  delete "variants/delete_dish/:id" => "variants#delete_dish", as: "delete_dish"
  delete "variants/delete_product/:id" => "variants#delete_product", as: "delete_product"

  get "pizza/preview/:id" => "pizza#preview"
  get "pizza/change_price/:id" => "pizza#change_price"
  get "pizza/change_rkeeper/:id" => "pizza#change_rkeeper"

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  #get "pizza/logout" => "sessions#destroy"
  #get "products/logout" => "sessions#destroy"
  get "products/preview/:id" => "products#preview"

  get "beer" => "products#beer"

  get "delivery_peter" => "main_page#delivery_peter"
  get "delivery_pushkin" => "main_page#delivery_pushkin"
  get "delivery_kolpino" => "main_page#delivery_kolpino"
  get "delivery_terlyaevo" => "main_page#delivery_terlyaevo"

  get "restaurants_peter" => "main_page#restaurants_peter"
  get "restaurants_pushkin" => "main_page#restaurants_pushkin"
  get "restaurants_kolpino" => "main_page#restaurants_kolpino"
  get "restaurants_terlyaevo" => "main_page#restaurants_terlyaevo"
  get "children_event" => "main_page#children_event"
  get "children_foto" => "main_page#children_foto"

  get "prize" => "uno_bonus#prize"
  get "check_cart/:id_cart" => "uno_bonus#check"

  resources :main
  resources :classifications do
    resources :pizza
  end
  #resources :variants
  resources :pizza
  resources :pizzerias
  resources :products
  resources :sauces

  #resources :pizza do
  #  resources :price
  #end
  #resources :products do
  #  resources :price
  #end
  #resources :sizes do
  #  resources :price
  #end
  #resources :sauces do
  #  resources :price
  #end
  #resources :dough do
  #  resources :price
  #end
  resources :users
  resources :sessions
  resources :line_items
  resources :carts
  resources :sendforms
  resources :stock
  resources :uno_bonus

  get "/*other_all_page" => "sessions#new"

end
