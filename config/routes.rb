Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root url
  root to: 'sessions#new'

  #login and logout
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  #login via Facebook
  get '/auth/facebook/callback' => 'sessions#create'
  get 'auth/failure', to: redirect('/')


  #routes for users, boards, outfits
  resources :users do
    resources :boards , shallow: true do
      resources :outfits, shallow: true
  end
end

  #once user is logged in show 'welcome'
  get '/welcome' => 'welcome#welcome'

end
