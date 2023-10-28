Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    authenticated :user do
      root 'groups#index', as: :authenticated_root
        resources :groups do
          resources :expense_transactions
        end
        resources :expense_transactions
    end

    unauthenticated do
      root to: 'pages#index', as: :unauthenticated_root
    end
  end

end
