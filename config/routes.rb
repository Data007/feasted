Feasted::Application.routes.draw do
  namespace :admin do
    resources :wings do
      resources :rooms, controller: 'wings/rooms'
    end
  end

  resources :wings do
    resources :rooms, controller: 'wings/rooms'
  end

  match '/admin' => 'admin#index'

  root to: 'wings#index'
end
