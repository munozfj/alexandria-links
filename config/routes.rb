AlexandriaLinks::Application.routes.draw do

  get 'admin' => 'admin#index'
  #match '/store/:id',  to: 'store#show'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  scope '(:locale)' do
    match '/:locale/store/:id',  to: 'store#show'
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

  end

end
