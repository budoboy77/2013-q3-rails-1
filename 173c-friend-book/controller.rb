require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
	@people = Person.order(:name).all
  halt erb(:login)
end

post "/login" do
	@people = Person.order(:name).all
  if Person.where(name: params[:username]).first.authenticate(params[:password]) != false
  	redirect "/followers"
  else
  	halt erb(:login)
  end
end

get "/followers" do
  halt erb(:followers)
end

post "/followers" do
  # TODO: write this
end

get "/logout" do
  session.clear
  redirect "/"
end
