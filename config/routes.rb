Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/hashtags',         to: 'hashtags#index',     as: :hashtags
  get '/hashtags/:hashtag', to: 'hashtags#show',      as: :hashtag

  get '/boards/feed' => 'boards#feed', as: :feed
  post '/boards/feed' => 'boards#feed'

  root to: 'sessions#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :users do
    resources :boards , shallow: true do
      resources :outfits, shallow: true
    end
  end

end
