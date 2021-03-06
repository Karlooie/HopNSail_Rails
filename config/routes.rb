Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  
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
    root to: 'application#root', as: :authenticated_root
    get "edit_settings",      to: 'settings#edit'
    put 'update_settings',    to: 'settings#update'
  end

  resources :rides do 
    resources :submissions do 
      member do
        get :approve
        get :reject
      end
    end
  end
  resources :boats

  root to: 'pages#index'

  #######
  # API #
  #######

  mount API::Base => '/'
  mount GrapeSwaggerRails::Engine => '/apidoc'

end
