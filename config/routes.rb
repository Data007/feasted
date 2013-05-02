Feasted::Application.routes.draw do
  namespace :admin do
    resources :wings do
      resources :rooms, controller: 'wings/rooms' do
        resources :patients, controller: 'wings/rooms/patients'
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
      resources :patients, controller: 'wings/rooms/patients' do
        resources :meals, controller: 'wings/rooms/patients/meals' do
          resources :orders, controller: 'wings/rooms/patients/meals/orders'
        end
      end
    end
  end

  match '/admin' => 'admin#index'

  root to: 'wings#index'
end
