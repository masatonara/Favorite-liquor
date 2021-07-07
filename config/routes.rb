Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/users/sessions',
    passwords: 'devise/users/passwords',
    registrations: 'devise/users/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'user/homes#top'
  get 'about' => 'user/homes#about'

  scope module: :user do
    resources :liquors, only: [:show, :index, :new, :edit, :create, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :create, :destroy, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get '/search', to: 'search#search'
  end
end
