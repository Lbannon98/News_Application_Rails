Rails.application.routes.draw do
  resources :articles
  root to: 'pages#index'
  devise_for :editors
  devise_for :users

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
