Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                       pathname: { sign_in: :login }
  end

  namespace :api do
    namespace :v1 do
      resources :users do
    	   resources :tasks
      end
       root to: 'users#index'
    end
  end

end
