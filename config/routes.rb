Rails.application.routes.draw do
  root to: 'boards#index'
  resources :boards do
    resources :posts, only: %I[create destroy update] do
      resource :cancellation, only: :create, controller: 'post_cancellations' do
        resource :invalidation, only: :create, controller: 'post_cancellation_invalidations'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
