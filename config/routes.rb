Training::Application.routes.draw do
  resources :trainees
  get 'trainees/shadow/:id', to: 'trainees#find_shadow'
  patch 'trainees/shadow/:id', to: 'trainees#sign_shadow'
  resources :mentors

  root :to => 'trainees#new'
end
