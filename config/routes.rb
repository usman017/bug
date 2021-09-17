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
  get 'developer/projects', to: 'projects_developer#developer_project', as: :developerProject
  get 'projects/:id/bugs/:id', to: 'bugs#details', as: :bugs
  get 'pro/bug', to: 'bugs#edit_developer', as: :edit_bug
  put 'update/bug', to: 'bugs#update_developer', as: :updateBug
  get 'developers/bug', to: 'projects_developer#show_bugs', as: :showBug
  get 'developers/bug/edit', to: 'projects_developer#edit_bug', as: :editBug
  put 'developers/update/bug', to: 'projects_developer#update_bug', as: :update_bug


  root to: 'home#index'
end
