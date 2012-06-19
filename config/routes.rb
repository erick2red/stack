Stack::Application.routes.draw do
  #root :to => 'files#list'

  get 'files' => 'files#list'

  controller :users do
    post 'users' => :create
    get 'users/:id' => :show
    get 'users' => :show
    delete 'users/:id' => :delete
    delete 'users' => :delete
    put 'users/:id' => :update
    put 'users' => :update
  end

  controller :sessions do
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # See how all your routes lay out with "rake routes"
end
