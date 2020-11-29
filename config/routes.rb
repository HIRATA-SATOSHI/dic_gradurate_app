Rails.application.routes.draw do
  # get 'students/new'
  # get 'students/index'
  # get 'students/show'
  # get 'students/edit'
  delete 'students/destroy_all'
  resources :students do
    collection do
      post :confirm
    end
  end
end
