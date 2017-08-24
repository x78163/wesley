Rails.application.routes.draw do

  get 'memoriams/index'

  get 'memoriams/new'

  get 'memoriams/create'

  get 'memoriams/edit'

  get 'memoriams/update'

  get 'memoriams/destroy'

  devise_for :users
 resources :sermons
 resources :prayers
 resources :memoriams

  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
   get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
# conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  get '/history' => 'pages#history'
   get '/team' => 'pages#team'
   get '/indexhome' => 'pages#indexhome'
   get '/construction' => 'pages#construction'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
