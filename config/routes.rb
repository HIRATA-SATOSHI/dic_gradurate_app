Rails.application.routes.draw do
  resources :forms do
    collection do
      post :confirm
      get :done
    end
  end
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
  
  post 'mailer/students', controller: 'mailer/students', action: 'send_form'
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
