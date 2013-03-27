Feasted::Application.routes.draw do
  namespace :admin do
    resources :wing 
  end

  match '/admin' => 'admin#index'
end
