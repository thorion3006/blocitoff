Rails.application.routes.draw do

  devise_for :users
  resources :users, only: :show do
    resources :items, only: [:create, :destroy]
  end

  get 'index' => 'welcome#index'

  root 'root#root'

  # For LetterOpenerWeb
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
