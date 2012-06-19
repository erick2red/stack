Stack::Application.routes.draw do
  #root :to => 'files#list'

  get 'files' => 'files#list'

  controller :users do
    post 'create' => :create
    delete 'delete' => :delete
    put 'enable' => :enable
    put 'disable' => :disable
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # See how all your routes lay out with "rake routes"
end
