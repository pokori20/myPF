Rails.application.routes.draw do
  namespace :admin do
    get 'searches/search'
  end
    # 管理者用
    devise_for :admin, skip: [:passwords] , controllers: {
    registrations: "admin/registrations",
    sessions: 'admin/sessions'
  }
  namespace :admin do
   root :to => 'homes#top'
   resources :publics, only: [:index, :create, :new, :edit, :update, :show]
  resources :shops, only: [:index, :create, :edit, :update]
  resources :shifts, only: [:new, :index, :create, :show]
  resources :offs, only: [:show]
  #検索機能
  get '/search', to: 'searches#search'
  post '/guest_sign_in', to: 'guests#guest_sign_in'
  end

    # 従業員用
    devise_for :publics, skip: [:passwords, :registrations] , controllers: {
    sessions: 'public/sessions'
  }
  scope module: :public do
    #homesコントローラー
    root to: "homes#top"
    #publicsコントローラー
    get 'publics/my_page' => 'publics#show'
    get 'publics/my_page/edit' => 'publics#edit'
    patch 'publics/update' => 'publics#update'
    #shiftsコントローラー
    resources :shifts, only: [:show]
    resources :offs, only: [:new, :create]
    resource :offs, only: [:destroy], as: 'delete_off'
    post '/guest_sign_in', to: 'guests#guest_sign_in'
    #Commentコントローラー
    resources :comments, only: [:new, :create, :destroy ,:update]
  end


end
