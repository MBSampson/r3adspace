Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :ads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'category_filter', to: 'ads#category_filter', as: 'ads_category_filter'
  get 'poster_filter', to: 'ads#poster_filter', as: 'ads_poster_filter'

  root to: 'ads#index'
end
