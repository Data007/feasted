Feasted::Application.routes.draw do
  namespace :admin do
    resources :wings do
      resources :rooms, controller: 'wings/rooms' do
        member do
          get :update_patients
        end
      end
    end
    resources :diets do
      resources :foods, controller: 'diets/foods'
    end
    resources :foods
  end

  resources :wings do
    resources :rooms, controller: 'wings/rooms' do
      resources :patients, controller: 'wings/rooms/patients'
    end
  end

  match '/admin' => 'admin#index'

  root to: 'wings#index'
end
