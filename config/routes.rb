Copypaste::Application.routes.draw do

  root :to => 'home#index'

  # links
  resources :links do
    resources :comments
  end

  # ajax nokogiri parser
  get '/search' => 'search#index'

  # twitter test
  get '/news' => 'news#index'


end
