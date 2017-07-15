Rails.application.routes.draw do

 resources :sermons
 resources :prayers

  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
