Rails.application.routes.draw do

  resources :users do
    resources :questions
  end
  resources :questions do
    resources :responses do
      member do
        post 'upvote'
      end
    end
  end


  get "/log-in" => "sessions#new", as: :log_in
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
