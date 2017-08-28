Rails.application.routes.draw do
  devise_for :companies
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: [:show] do
    resources :job_offers, only: [:index, :new, :create]
  end

  get 'job_search', to: 'pages#job_search', as: :job_search
  get 'profile', to: 'users#profile', as: :profile
  get 'company_profile', to: 'companies#profile', as: :company_profile
  get 'my_job_applications', to: 'users#job_applications', as: :user_job_applications

  resources :job_offers, only: [:index, :show] do
    resources :job_applications, only: [:index, :new, :create]
  end
  resources :job_applications, only: [:show] do
     patch 'accept_application', 'decline_application'
   end
end
