Rails.application.routes.draw do
  scope '/api' do
    devise_for :users, path: '', path_names: {
      sign_in: '/auth/login',
      sign_out: '/auth/logout',
      registration: '/auth/signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    resources :jwks, only: [:index]
    get '/current_user', to: 'user#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
