Rails.application.routes.draw do
  # resources :complainants, module: 'complainants' do
  #   resources :complaints, only: [:index, :show, :create]
  # end
  # devise_for :users
  
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, controllers: { sessions: :sessions },
                         path_names: { sign_in: :login }
      resource :user, only: [:show, :update]
      scope :complainants, module: 'complainants' do
        resources :complaints, only: [:index, :show, :create]
      end
      scope :responders, module: 'responders' do
        resources :complaints, only: [:index, :show, :update]
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
