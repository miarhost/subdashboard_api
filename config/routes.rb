Rails.application.routes.draw do
  devise_for :users
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
