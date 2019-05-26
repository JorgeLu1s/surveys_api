Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json} do
    resources :surveys
    resources :users
    resources :assessments, only: [:create, :update]
    post 'user_token' => 'user_token#create'
  end
end
