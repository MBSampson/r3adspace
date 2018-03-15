Rails.application.routes.draw do
  resources :ads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'filter', to: 'ads#filter', as: 'ads_filter'

  root to: 'ads#index'
end
