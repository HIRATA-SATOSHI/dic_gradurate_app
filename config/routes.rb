Rails.application.routes.draw do
  devise_for :staffs
  # get 'students/new'
  # get 'students/index'
  # get 'students/show'
  # get 'students/edit'
  root 'students#index'
  resources :students do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
