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
    flash.now[:error] = "Wrong username"
    halt erb(:login)
  elsif named_user.authenticate(params[:password]) == false
    flash.now[:error] = "Incorrect Password"
=======
    # TODO: show the user the message "Unknown username"
    halt erb(:login)
  elsif named_user.authenticate(params[:password]) == false
    # TODO: show the user the message "Wrong password"
>>>>>>> 19a5575f225fb50811ad928be62a84aa5564baf0
    halt erb(:login)
  else
    session[:user_id] = named_user.id
    redirect "/welcome"
  end
end

get "/welcome" do
  @user = User.find(session[:user_id])
  halt erb(:welcome)
end

get "/logout" do
  session.clear
  redirect "/login"
end
