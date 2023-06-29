Rails.application.routes.draw do

  devise_for :admin, skip:[:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"

    resources :addresses, only: [:index, :destroy, :edit, :create, :update]


    resources :cart_items, only: [:index, :update, :destroy, :create]do
      collection do
        delete :all_destroy
      end

    end

    resources :customers, only: [:update, :edit, :show]do
      collection do
        get :check
        patch :withdrawl
      end
    end
    get 'customers/mypage', to: 'customers#show'
    get 'customers/information/edit', to: 'customers#edit'


    resources :items, only: [:index, :show]

    get 'homes/about', to: 'homes#about'


    resources :homes do
      collection do
        get :top
        get :about
      end
    end

    resources :orders, only: [:show, :new, :index, :create] do
      collection do
        post :check
        get :finish
      end
    end
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]


    resources :genres, only: [:index, :create, :update, :update, :edit]


    resources :items, only: [:new, :create, :index, :show, :edit, :update]


    resources :homes, only: [:top]

    resources :orders, only: [:show, :update, :index]

    resources :order_details, only: [:update]

  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
