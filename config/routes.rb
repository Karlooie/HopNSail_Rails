Rails.application.routes.draw do
  
  devise_for :users
  
  devise_scope :user do 
    get "login",              to: "devise/sessions#new"
    get "logout",             to: "devise/sessions#destroy"
    get "signup",             to: "devise/registrations#new"
  end



  unauthenticated do
    root to: "coming_soon#index", as: :unauthenticated_root
    # root to: "pages#index", as: :unauthenticated_root
  end


  authenticated :user do
    root to: 'rides#index', as: :authenticated_root
    get "edit_settings",      to: 'settings#edit'
    put 'update_settings',    to: 'settings#update'
  end


  resources :rides

  resources :boats

end
