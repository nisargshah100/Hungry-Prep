HungryPrep::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "home#index"

  match '/admin', :to => 'admin/dashboard#show'
  resources :candidates
  resources :applications
  namespace :admin do
    resources :candidates do 
      resources :reviews
    end
    resources :reviewers
    resources :candidate_reviewers
    resources :questions
    resources :statuses
  end

  # match '/admin/candidates', :to => 'admin/candidate_reviewers#index'

end
