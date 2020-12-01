Rails.application.routes.draw do
  # devise_for :staffs
  # get 'students/new'
  # get 'students/index'
  # get 'students/show'
  # get 'students/edit'
  # root 'students#index'
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
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
