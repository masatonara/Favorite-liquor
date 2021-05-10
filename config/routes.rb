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
    get 'about' => 'customers/products#about'
    
    scope module: :user do
      resources :users, only: [:index, :show, :create, :destroy, :update]
      resources :liquors, only: [:index, :new, :show, :edit, :create, :destroy, :update] do
        resource :comments, only: [:create, :destroy]
        resource :fsvorites, only: [:create, :destroy]
      end
      resources :restaurants, only: [:index, :show, :edit, :create, :destroy, :update]
    end



end
