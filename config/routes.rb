Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root to: 'public/homes#top'

  namespace :public do
    get 'homes/about'

    get 'customers/unsubscribe' =>'customers#unsubscribe', as: :unsubscribe
    patch 'customers/withdraw' =>'customers#withdraw', as: :withdraw
    resources :customers, only: [:show,:edit,:update]

    resources :addresses, only: [:index,:edit,:create,:updaate,:destroy]

    resources :items, only: [:index,:show]

    post 'orders/confirm' =>'orders#confirm', as: :confirm
    get 'orders/complete' =>'orders#complete', as: :complete
    resources :orders, only: [:new,:index,:show]

    resources :cart_items,  only: [:index,:create,:update,:destroy] do
      collection do
        delete 'destroy_all'
      end
    end
  end





  namespace :admin do
    get '/' => 'homes#top'

    resources :items, only: [:index,:new,:create,:show,:edit,:update]

    resources :orders, only: [:show,:update]

    resources :genres, only: [:index,:create,:edit,:update]

    resources :customers, only: [:index,:show,:edit,:update]

    resources :oreder_deatils, only: [:upadate]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
