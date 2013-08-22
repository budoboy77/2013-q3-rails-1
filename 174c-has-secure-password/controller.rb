require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/users/new" do
  @user = User.new
  halt erb(:new)
end

post "/users/new" do
  @user = User.new
  @user.username = params[:new_username]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]
  if @user.save == true
    redirect "/welcome"
  else
    halt erb(:new)
  end
end

get "/login" do
  halt erb(:login)
end

post "/login" do
  # TODO: set user_id in session and redirect to /welcome if correct login,
  #   otherwise complain "Unknown username" or "Wrong password"
end

get "/welcome" do
  @user = User.find(session[:user_id])
  halt erb(:welcome)
end

get "/logout" do
  session.clear
  redirect "/login"
end
