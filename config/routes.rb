Feasted::Application.routes.draw do
  namespace :admin do
    resources :wings
  end

  match '/admin' => 'admin#index'
end
