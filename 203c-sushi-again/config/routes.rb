App::Application.routes.draw do
  #   get 'products/:id' => 'catalog#view'
  get '/' => 'main#root'
  get '/place_order' => 'main#place_order_get'
  post '/place_order' => 'main#place_order_post'

  get '/orders' => 'admin#orders_get'
  get '/dishes' => 'admin#dishes_get'
  get '/admin/login' => 'admin#login_get'
  post '/admin/login' => 'admin#login_post'
  get '/admin/logout' => 'admin#logout'
end