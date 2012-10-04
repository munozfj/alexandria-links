AlexandriaLinks::Application.routes.draw do

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    resources :books
    resources :articles
    resources :books do
      get :who_bought, :on => :member
    end
    root :to => 'store#index', :as => 'store'
  end

end
