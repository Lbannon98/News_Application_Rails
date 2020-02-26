Rails.application.routes.draw do
  resources :articles
  resources :newsapi
  resources :pages

  root to: 'pages#index'

  post '/validate', :controller=> 'articles', :action=> 'validate'

  devise_for :editors, path: 'editors'
  devise_for :users, path: 'users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
