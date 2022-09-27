Rails.application.routes.draw do
  # devise_for :users
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users
      scope :complainants, module: 'complainants' do
        resources :complaints, only: [:index, :show, :create]
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
