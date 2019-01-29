Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    devise_for :users
  end

  namespace :api do
    namespace :v1 do
      resources :users do
    	   resources :tasks
      end
       root to: 'users#index'
    end
  end
 
  scope '/api' do
    scope '/v1' do
      scope '/users' do
        get '/' => 'api_users#index'
        post '/' => 'api_users#create'
        scope '/:name' do
          get '/' => 'api_users#show'
          put '/' => 'api_users#update'
          scope '/tasks' do
            get '/' => 'api_tasks#index'
            post '/' => 'api_tasks#create'
            scope '/:task_name' do
              get '/' => 'api_tasks#show'
              put '/' => 'api_tasks#update'
            end
          end
        end
      end
    end
  end
end
