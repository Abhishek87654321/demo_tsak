Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :comments, :posts, :blogs
  get 'post/:id/comment_new' => 'comments#comment_new'
  get 'post/:id/comment_new_first' => 'comments#comment_new_first'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
