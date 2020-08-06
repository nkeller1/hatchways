Rails.application.routes.draw do

  namespace :api do
    get '/ping', to: 'ping#index'
    get '/posts', to: 'post#index'
  end
end
