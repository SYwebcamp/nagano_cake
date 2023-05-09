Rails.application.routes.draw do
  devise_for :admin, skip:[:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    resources :addresses, only: [:index, :show]
  end
  namespace :public do
    resources :orders, only: [:new, :finish, :index, :show]
  end
  namespace :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]do
      collection do 
        delete :all_destroy
      end
      
    end
  end
  namespace :public do
    get 'customers/mypage', to: 'customers#show'
    get 'customers/information/edit', to: 'customers#edit'
    # resources :customers, [:show, :edit, :check]
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    resources :homes, only: [:top, :about]
  end
  namespace :admin do
    resources :orders, only: [:show]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :update, :post, :edit]
  end
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end
  namespace :admin do
    resources :homes, only: [:top]
  end





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
