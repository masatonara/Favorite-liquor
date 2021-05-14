Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'devise/admins/sessions',
    passwords: 'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }


  devise_for :users, controllers: {
    sessions: 'devise/users/sessions',
    passwords: 'devise/users/passwords',
    registrations: 'devise/users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root :to =>'user/homes#top'
    get 'about' => 'user/products#about'
    get 'user/search/search'
    
    scope module: :user do
      resources :liquors, only: [:index, :new, :show, :edit, :create, :destroy, :update] do
        resource :comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
      resources :users, only: [:index, :show, :edit, :create, :destroy, :update] do
        resource :relationships, only: [:create, :destroy]
        	get 'followings' => 'relationships#followings', as: 'followings'
        	get 'followers' => 'relationships#followers', as: 'followers'
      end
      get '/search', to: 'search#search'
    end



end
