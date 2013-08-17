Searchflickr::Application.routes.draw do
  resources :images, only: [:new, :index]

  root 'images#new'
end
