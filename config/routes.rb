Rails.application.routes.draw do
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  resources :foods

  resources :users do
    resources :meals
  end

  resources :meals do
    resources :comments, only: [:index, :new, :show]
  end

  resources :comments, only: [:index, :new, :create, :show]

  get '/mostmeals', to: 'users#mostmeals'

  get '/all_meals', to: 'meals#all_meals'

  get '/foods/:id/next', to: 'foods#next_food'

end
