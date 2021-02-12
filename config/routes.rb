Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :messages, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show 
  post   '/like/:post_id' ,to: 'likes#like',   as: 'like'
  delete '/like/:post_id' ,to: 'likes#unlike', as: 'unlike'
end
