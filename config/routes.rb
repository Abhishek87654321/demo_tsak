Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :comments, :posts , :blogs
  get 'post/:id/comment_new' => 'comments#comment_new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
