Rails.application.routes.draw do
  resources :result_items
  resources :results  do    
    collection do    
      get "get_normal_value" => "results#get_normal_value"
    end
  end
  resources :receipt_items
  resources :sample_types
  resources :analyse_elements
  resources :imputations
  resources :arrival_mails do   
    get "delete"
  end
  resources :samples do    
    get "delete"
  end
  resources :analyse_types do    
    get "delete"
  end
  resources :sample_types do    
    get "delete"
  end
  resources :options do    
    get "delete"
  end
  resources :life_qualities do    
    get "delete"
  end
  resources :risk_factors do    
    get "delete"
  end
  resources :eating_habits do    
    get "delete"
  end
   
  resources :family_antecedents do    
    get "delete"
  end
  resources :obstetric_gynecologist_antecedents do    
    get "delete"
  end
  resources :surgical_antecedents do    
    get "delete"
  end 
  resources :medical_antecedents
  resources :treatments
  resources :consultation_diagnostic_hypotheses do    
    get "delete"
  end
  resources :consultation_summaries
  resources :syndromic_groupings
  resources :consultation_resumes
  resources :physical_exams
  resources :general_exams
  resources :antecedents
  resources :analysis_items
  resources :analyses do     
    get "delete"

    
  end
  resources :precocious_warnings
  resources :prescription_items do    
    get "delete"
  end 
  
  resources :prescriptions do    
    get "delete"
  end

  resources :doctor_plannings do    
    get "delete"

    collection do    
      get "get_doctors" => "doctor_plannings#get_doctors"
    end

  end

  resources :doctor_availabilities do    
    get "delete"

    collection do    
      get "get_doctors" => "doctor_availabilities#get_doctors"
    end

  end
  
  resources :localities do    
    get "delete"
  end
  resources :insured_lists do    
    get "delete"
  end

  resources :medical_specialities do    
    get "delete"
  end

  resources :medical_record_closures do    
    get "delete"
  end

  resources :medical_record_closure_reasons do    
    get "delete"
  end

  resources :social_cases do    
    get "delete"
  end

  resources :ethnic_groups do    
    get "delete"
  end
  
  resources :hospital_lists do    
    get "delete"
  end

  resources :guard_lists do    
    get "delete"

    collection do    
      get "get_doctors" => "guard_lists#get_doctors"
    end


  end

  resources :hospital_discharges do    
    get "delete"
  end

  resources :transfers do    
    get "delete"

    collection do    
      get "get_doctors" => "transfers#get_doctors"
    end
  end

  resources :evacuations do    
    get "delete"

    collection do    
      get "get_doctors" => "evacuations#get_doctors"
    end

    
  end

  resources :hospitalizations do    
    get "delete"

    collection do    
      get "get_doctors" => "hospitalizations#get_doctors"
    end
  end 
  resources :exams do    
    get "delete"
  end

  resources :examination_requests do    
    get "delete"
  end

  resources :exam_types do    
    get "delete"
  end

  resources :diagnostic_hypotheses do    
    get "delete"
  end

  resources :consultations do    
    get "delete"
    get "get_doctors" => "consultations#get_doctors"

    collection do   
      #get "get_doctor" => "consultations#get_doctor"
 
    end
    
  end

  resources :input_stock_outlets do    
    get "delete"

    collection do    
      get "get_inputs" => "input_stock_outlets#get_inputs"
 
    end

  end

  resources :input_stock_entries do    
    get "delete"
    collection do    
      get "get_inputs" => "input_stock_entries#get_inputs"
 
    end
  end

  resources :inputs do    
    get "delete"
  end

  resources :input_types do    
    get "delete"
  end
  
  resources :orders do    
    get "delete"
  end
  resources :prestation_types do    
    get "delete"
  end
  
  resources :sales do    
    get "delete"

    collection do
      get "get_medicaments" => "sales#get_medicaments"
      get "get_medicament_price" => "sales#get_medicament_price"

    end


  end
  resources :stock_outlets do    
    get "delete"

    collection do
      get "get_medicaments" => "stock_outlets#get_medicaments"
    end

  end
  resources :stock_entries do    
    get "delete"
    collection do
      get "get_medicaments" => "stock_entries#get_medicaments"
    end
  end
  resources :providers do    
    get "delete"
  end

  resources :complementary_exams  do    
    get "delete"
  end
  
  resources :medical_record_allergies do     
    get "delete"
  end
  resources :allergies do   
    get "delete"
  end
  resources :allergy_categories do   
    get "delete"
  end
  resources :insurance_medicaments do   
    get "delete"
  end

  resources :insurance_prestations do    
    get "delete"
  end

  resources :prestations do    
    get "delete"
  end

  resources :medical_records do   
    get "delete"
  end

  resources :waiting_lists  do      
    get "delete"
    #get "show/medical_record" => "medicalr"
  end

  resources :receipts do    
    get "delete"
    
    collection do  
        get "get_doctors" => "receipts#get_doctors"
        get "get_analysis_amount" => "receipts#get_analysis_amount"

    end
    
  end
  
  resources :patients do   
    get "delete"
  end

  resources :insurances do   
    get "delete"
  end


  resources :insurance_types do    
    get "delete"
  end
  
  resources :payment_methods do    
    get "delete"
  end
  
  resources :antecedent_families do    
    get "delete"
  end

  resources :medicaments do    
    get "delete"
  end

  resources :medicament_families do    
    get "delete"
  end

  resources :currencies do    
    get "delete"
  end

  resources :rooms do    
    get "delete"
  end

  resources :head_of_services do    
    get "delete"
  end

  #devise_for :users
  
  resources :services  do   
    get "delete"
  end
  
  resources :permission_roles do    
    get "delete"
  end

  get "/dashboard" => "dashboard#index" , as: :dashboard

  #get "/users"     => "custom_users#index", as: :all_users 

	get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 

	post "/users/create"     => "custom_users#create", as: :create_user
	get "/users/new"     => "custom_users#new", as: :new_user
  get "/user/edit/:id" => "custom_users#edit", as: :edit_user
  get "/users" => "custom_users#users_and_permissions", as: :users_and_permissions


	patch "/user/update/:id" => "custom_users#update", as: :update_user


	delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
	
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user
  
  get "/organization" => "organizations#show", as: :show_organization
  get "all/allergies" => "allergies#allergies", as: :all_allergies

  get "receipt/analyses" => "analyses#receipt_analyses", as: :receipt_analyses

  #get "/receipts/get_doctor" => "receipts#get_doctor"
  #get "/receipts/get_prestation_amount" => "receipts#get_prestation_amount"
  #get "/consultations/get_doctor" => "consultations#get_doctor"
  
  resources :organizations
  resources :profiles
  #devise_for :users
  resources :permissions
  resources :roles do 
    get "delete"   
  end
  
  devise_for :users, path: '', controllers: { 
    registrations: "users/registrations",
    confirmations: 'users/confirmations',
    passwords: "users/passwords",
    sessions: "users/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
    }
   
  #root 'config_options#new'
  devise_scope :user do
    root to: "users/sessions#new"
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  # Dynamic error pages
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"

end
