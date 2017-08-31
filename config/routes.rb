Rails.application.routes.draw do
  devise_for :companies, controllers: { sessions: 'companies/sessions'}
  devise_for :users
  resources :users, only: [:show, :index]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :job_offers, only: [:new, :create]

  get 'job_search', to: 'pages#job_search', as: :job_search
  get 'profile', to: 'users#profile', as: :profile
  get 'about', to: 'pages#about', as: :about
  get 'company_profile', to: 'companies#profile', as: :company_profile
  get 'my_job_applications', to: 'users#job_applications', as: :user_job_applications

  resources :job_offers, only: [:index, :show] do
    resources :job_applications, only: [:index, :new, :create]
  end
  resources :job_applications, only: [:show] do
     get 'accept_application', 'decline_application'
   end
end
