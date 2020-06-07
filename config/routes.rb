Rails.application.routes.draw do
  root to: 'boards#index'
  resources :boards do
    resources :posts, only: %I[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
