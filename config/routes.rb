Rails.application.routes.draw do
  get '/capstones' => 'capstones#index'

  get '/capstones/:id' => 'capstones#show'
end
