Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :bugs
  end
  get 'users/projects', to: 'project#all_project', as: :user_projects
  get 'users/developers', to: 'user#index', as: :users
  get 'bugs', to: 'bug#all_bug', as: :allBugs

  root to: 'home#index'
end
