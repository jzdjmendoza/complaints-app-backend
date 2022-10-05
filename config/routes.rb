Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :complainants, module: 'complainants' do
  #   resources :complaints, only: [:index, :show, :create]
  # end
  # devise_for :users
  
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, controllers: { sessions: :sessions, registrations: :registrations },
                        path_names: { sign_in: :login, registration: 'register' }
      resource :user, only: [:show, :update]
      scope :complainants, module: 'complainants' do
        resources :complaints, only: [:index, :show, :create]
      end
      scope :responders, module: 'responders' do
        resources :complaints, only: [:index, :show, :update]
        resources :complainants, only: [:index, :show, :update]
      end
      scope :public, module: 'public' do
        get '/regions', to: 'locations#regions'
        get '/provinces', to: 'locations#provinces'
        get '/cities', to: 'locations#cities'
        get '/barangays', to: 'locations#barangays'
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
