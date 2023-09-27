Rails.application.routes.draw do
  root 'url_histories#index'

  resources :url_histories, only: [:index, :create] do
    collection do
      get 'email_report', to: 'url_histories#email_report'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
