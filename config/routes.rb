RedditClone::Application.routes.draw do
  resources :users
  resource :session, :only => [:destroy, :new, :create]

  resources :subs
  resources :links do
    member do
      post "upvote" => "LinkVotes#upvote"
      post "downvote" => "LinkVotes#downvote"
    end
    resources :comments
  end
end
