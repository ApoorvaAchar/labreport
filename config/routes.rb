Rails.application.routes.draw do
  get "file_uploads/upload"
  resources :test_results do 
    member do
      get :generate_pdf
    end
  end


  namespace :api do
    post 'test_result_upload', to: 'test_results#test_result_upload'
  end
  
  resources :lab_tests do 
    resources :test_parameters  do 
      resources :parameter_ref_ranges
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "website#index"
end
