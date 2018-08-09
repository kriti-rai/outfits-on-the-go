Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#welcome'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :users, shallow: true do
    resources :boards, shallow: true do
      resources :outfits
    end
  end



end
