Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers

  root to: 'public/homes#top'

  namespace :public do
    get 'homes/about'
  end


  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/complete'
  end

  namespace :public do
    get 'cart_items/index'
  end

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/exit'
  end
  namespace :admin do
    get '/' => 'homes#top'
  end

  namespace :admin do
    get 'orders/show'
  end

  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
