Feasted::Application.routes.draw do
  namespace :admin do
    resources :menus do
      resources :days, controller: 'menus/days' do
        resources :meals, controller: 'menus/days/meals' do
          resources :foods, controller: 'menus/days/meals/foods'
        end
      end
    end 
    resources :rooms do
      member do
        get :update_patient_count
        get :update_room_number
      end
      resources :patients, controller: 'rooms/patients' do
        resources :diets, controller: 'rooms/patients/diets'
        resources :allergies, controller: 'rooms/patients/allergies'
        resources :likes, controller: 'rooms/patients/likes'
        resources :dislikes, controller: 'rooms/patients/dislikes'
        member do
          get :select_option_for_patient
          get :edit_patient_name
        end
      end
      member do
        get :update_patients
      end

    end
    resources :diets do
      resources :foods, controller: 'diets/foods'
    end
    resources :foods
    resources :orders
  end

  resources :rooms do
    resources :patients, controller: 'rooms/patients' do
      resources :completed, controller: 'rooms/patients/completed'
        
      resources :meals, controller: 'rooms/patients/meals' do
        member do
          get :select_option_for_patients
          post :place_order
        end
        resources :orders, controller: 'rooms/patients/meals/orders' do
          member do
            post :edit_order
            get :place_order
          end
        end
      end
    end
  end

  match '/admin' => 'admin#index'

  root to: 'rooms#index'
end
