App::Application.routes.draw do
  get  "/"         => "main#index"
  get  "/login"    => "main#login"
  post "/login"    => "main#login_post"
  get  "/logout"   => "main#logout"
  get "/edit/:id"	   => "main#edit_get"
  post "/edit/:id"     => "main#edit_post"
  get "/new"	   => "main#new_get"
  post "/new"	   => "main#new_post"
end
