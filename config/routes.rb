Rails.application.routes.draw do

  #homepage route
  root "articles#index"
  
  # mapping all routes for the articles and their comments
  resources :articles do
    resources :comments
  end
end
