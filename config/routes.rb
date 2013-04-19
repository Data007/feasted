Feasted::Application.routes.draw do
  namespace :admin do
    resources :wings do
      resources :rooms, controller: 'wings/rooms' do
        member do
          get :update_patients
        end
      end
    end
    resources :diets
    resources :foods
  end

  resources :wings do
    resources :rooms, controller: 'wings/rooms'
  end

  match '/admin' => 'admin#index'

  root to: 'wings#index'
end
