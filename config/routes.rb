AlexandriaLinks::Application.routes.draw do

  #get "admin/index"

  #get "sessions/new"get "store/show"

  #get "sessions/create"

  #get "sessions/destroy"

  get 'admin' => 'admin#index'
  #match '/show',  to: 'store#show'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  scope '(:locale)' do
    resources :store
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    resources :books
    resources :articles
    resources :books do
      get :who_bought, :on => :member
    end
    root :to => 'store#index' , :as => 'store'
#get "store/show"
  end

end
