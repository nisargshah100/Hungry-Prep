HungryPrep::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "home#index"

  resources :candidates

  namespace :admin do
    resources :candidates
    resources :reviewers
    resources :reviews
    resources :candidate_reviewers
    resources :questions
  end

  match '/admin', :to => 'admin/dashboard#show'

end
