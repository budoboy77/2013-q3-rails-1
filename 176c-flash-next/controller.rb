require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
  halt erb(:login)
end

post "/login" do
  named_user = User.where(username: params[:username]).first

  if named_user == nil 
<<<<<<< HEAD
    flash[:error] = "Wrong Username"
    redirect "/login"
  elsif named_user.authenticate(params[:password]) == false
    flash[:error] = "Incorrect Password"
    redirect "/login"
  else
    session[:user_id] = named_user.id
    flash[:success] = "You are logged in."
    redirect "/welcome"
=======
    # TODO: Redirect to /login with message "Unknown username"
  elsif named_user.authenticate(params[:password]) == false
    # TODO: Redirect to /login with message "Wrong password"
  else
    session[:user_id] = named_user.id
    # TODO: Redirect to /welcome with message "You have successfully logged in"
>>>>>>> 19a5575f225fb50811ad928be62a84aa5564baf0
  end
end

get "/welcome" do
  @user = User.find(session[:user_id])
  halt erb(:welcome)
end

get "/logout" do
  session.clear
<<<<<<< HEAD
  flash[:success] = "You have logged out."
  redirect "/login"
=======
  # TODO: Redirect to /login with message "You have successfully logged out"
>>>>>>> 19a5575f225fb50811ad928be62a84aa5564baf0
end
