require '../dvc-sinatra.rb'

get "/" do
  halt erb(:login)
end

post "/" do
  @user = User.where(username: params[:username]).first
	  if @user == nil
	  	@user_name_error = "Error: Unknown Username"
	  	halt erb(:login)
	  else
	  	@password = @user.password
		  if @password != params[:password]
		  	@error = "Error: Incorrect Password"
		  	@password_error = "Error: Incorrect Password"
		  	halt erb(:login)
		  else
	  		redirect "/success"
		  end
   	  end
end

get "/success" do
  halt erb(:success)
end
