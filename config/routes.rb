Rails.application.routes.draw do
  # get 'students/new'
  # get 'students/index'
  # get 'students/show'
  # get 'students/edit'
  resources :students do
    collection do
      post :confirm
    end
  end
end
