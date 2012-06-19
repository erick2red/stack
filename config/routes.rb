Stack::Application.routes.draw do
  #root :to => 'files#list'

  get 'files' => 'files#list'

  controller :users do
    post 'users' => :create
    delete 'users/:id' => :delete
    delete 'users' => :delete
    put 'users/:id' => :update
    put 'users' => :update
    put 'users/enable' => :enable
    put 'users/disable' => :disable
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # See how all your routes lay out with "rake routes"
end
