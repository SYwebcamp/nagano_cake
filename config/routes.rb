Rails.application.routes.draw do
  devise_for :admin, skip:[:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/finish'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/check'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :update, :post, :edit]
  end
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end
  namespace :admin do
    get 'homes/top'
  end





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
