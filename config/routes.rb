require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  mount Sidekiq::Web => '/sidekiq'

  root to: 'pages#home'
  resources :campaigns, except: [:new] do
    post 'raffle', on: :member #rotas que tenham um ID /campaigns/id/raffle
    # post 'raffle', on: :collection -> rotas que nao tenham um ID
  end
  get 'members/:token/opened', to: 'members#opened'
  resources :members, only: [:create, :destroy, :update]
end