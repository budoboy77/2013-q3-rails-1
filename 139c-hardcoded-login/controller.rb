require '../dvc-sinatra.rb'

get "/" do
  
  halt erb(:login)
end

post "/" do
  if params[:username] != "amy"
  	@error = "Login failed!!!!"
  	@old_username = params[:username]
  	halt erb(:login)
  elsif params[:password] != "123"
  	@error = "Password incorrect!!!"
  	@old_username = params[:username]
    halt erb(:login)
  else
  	redirect "/welcome"
  end
end

get "/welcome" do
  halt erb(:welcome)
end
