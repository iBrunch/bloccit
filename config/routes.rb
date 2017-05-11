Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'
  
  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'about' => 'welcome#about'
  
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  
  root to: 'welcome#index'
end
