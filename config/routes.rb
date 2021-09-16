Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :projects_developer
  resources :projects do
    resources :bugs
  end
  get 'users/projects', to: 'projects#all_project', as: :user_projects
  get 'users/developers', to: 'users#index', as: :users
  get 'bugs', to: 'bugs#all_bug', as: :allBugs
  get 'developer/bugs', to: 'bugs#developer_bugs', as: :developer
  get 'projects/:id/developers', to: 'users#developer_index', as: :allDeveloper

  root to: 'home#index'
end
