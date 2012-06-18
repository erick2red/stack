Stack::Application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'files' => 'files#list'

  root :to => 'files#list'

  # See how all your routes lay out with "rake routes"
end
