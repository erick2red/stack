Stack::Application.routes.draw do
  controller :users do
    post 'users' => :create
    get 'users/:id' => :show
    get 'users' => :show
    delete 'users/:id' => :delete
    delete 'users' => :delete
    put 'users/:id' => :update
    put 'users' => :update
  end

  controller :groups do
    post 'groups' => :create
    get 'groups/:id' => :show
    get 'groups' => :show
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  controller :files do
    get 'files' => :index
    get 'files/list' => :list
  end
  # See how all your routes lay out with "rake routes"
end
