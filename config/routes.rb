Feasted::Application.routes.draw do
  namespace :admin do
    resources :wings do
      member do
        get :update_room_count
      end
      resources :rooms, controller: 'wings/rooms' do
        member do
          get :update_patient_count
          get :update_room_number
        end
        resources :patients, controller: 'wings/rooms/patients' do
          member do
            get :select_option_for_patient
            get :edit_patient_name
          end
        end
        member do
          get :update_patients
        end
      end
    end
    resources :diets do
      resources :foods, controller: 'diets/foods'
    end
    resources :foods
    resources :orders
  end

  resources :wings do
    resources :rooms, controller: 'wings/rooms' do
      resources :patients, controller: 'wings/rooms/patients' do
        
        resources :meals, controller: 'wings/rooms/patients/meals' do
          member do
            get :select_option_for_patients
            post :place_order
          end
          resources :orders, controller: 'wings/rooms/patients/meals/orders' do
            member do
              post :edit_order
            end
          end
        end
      end
    end
  end

  match '/admin' => 'admin#index'

  root to: 'wings#index'
end
