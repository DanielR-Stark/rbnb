Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :lodgings do
    resources :reservations, except: :index do
      collection do
        get "mis_reservas"
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
