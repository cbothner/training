Training::Application.routes.draw do
  resources :trainees do
    collection do
      get 'coordinator'
    end
  end
end
