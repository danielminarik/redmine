Rails.application.routes.draw do
  authenticated :user do
    root :to => "issues#index"
  end
  root 'welcome#index'
  resources :issues
  resources :comments
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
