RedditClone::Application.routes.draw do
  resources :users
  resource :session, :only => [:destroy, :new, :create]

  resources :subs
  resources :links do
    resources :comments
  end
end
