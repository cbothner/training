Training::Application.routes.draw do
  resources :trainees do
    collection do
      get 'coordinator'
    end
  end

  root :to => 'trainees#new'
end
