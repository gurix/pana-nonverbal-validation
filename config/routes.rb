Rails.application.routes.draw do
  root to: 'home#show'
  resources :subjects do
    resource :pana_validation_questionary
    end
  end
end
