Rails.application.routes.draw do
  resources :orders
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}

  resources :ads do
    member do
      get :toggle_published
    end
  end

  resources :charges

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'category_filter', to: 'ads#category_filter', as: 'ads_category_filter'
  get 'poster_filter', to: 'ads#poster_filter', as: 'ads_poster_filter'
  get 'purchase_ad', to: 'ads#purchase_ad', as: 'ads_purchase'
  get 'buy_ad', to: 'ads#buy_ad', as: 'ads_buy_ad'

  root to: 'ads#index'
end
