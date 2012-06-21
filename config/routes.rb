Faceroll::Application.routes.draw do
  root to: "welcome#index"
  resource :dashboard, only: [:show]
  resource :search, only: [:show]
  resources :posts, only: [:create, :update]
  resources :photos, only: [:create, :update]
  resources :users, only: [:show] do
    resources :friendships, only: [:create]
  end
  
  #same as root to within namespace below
  #get "admin" => "admin/dashboards#show"
  namespace :admin do
    root to: "dashboards#show"
    resource :dashboard, only: [:show]
    resources :users, only: [:index, :destroy, :show]
    resources :updates, only: [:index, :destroy, :show] 
  end
end
