Rails.application.routes.draw do
  devise_for :users
  
  # Dashboard para usuários autenticados
  get 'dashboard', to: 'dashboard#index'
  
  get 'settings', to: 'settings#index', as: :settings
  get 'support', to: 'support#index', as: :support
  get 'reports', to: 'reports#index', as: :reports
  
  # Redirecionar usuários autenticados para dashboard
  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
  end
  
  # Rota root para usuários não autenticados
  unauthenticated do
    root to: 'home#index', as: :unauthenticated_root
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
