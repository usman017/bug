Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :bugs
  end
  get 'users/projects', to: 'projects#all_project', as: :user_projects
  get 'users/developers', to: 'users#index', as: :users
  get 'bugs', to: 'bugs#all_bug', as: :allBugs
  get 'developer/bugs', to: 'bugs#developer_bugs', as: :developer


  root to: 'home#index'
end
