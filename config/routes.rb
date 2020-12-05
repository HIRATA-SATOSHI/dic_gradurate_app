Rails.application.routes.draw do
  resources :forms
  # devise_for :staffs
  resources :students do
    collection do
      post :confirm
    end
  end
  devise_scope :staff do
    root "staffs/sessions#new"
  end

  devise_for :staffs, :controllers => {
    sessions: 'staffs/sessions'
  }

  namespace :admin do
    resources :staffs
  end
  

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
