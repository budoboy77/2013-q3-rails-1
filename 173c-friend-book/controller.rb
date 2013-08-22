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
    session[:user_id] = Person.where(name: params[:username]).first.id
  	redirect "/followers"
  else
  	halt erb(:login)
  end
end

get "/followers" do
  @people = Person.order(:name).all
  halt erb(:followers)
end

post "/followers" do
  @people = Person.order(:name).all
  if params[:username] != ""
    follow =  Following.new
    follow.to_person_id = Person.where(name: params[:username]).first.id
    follow.from_person_id = session[:user_id]
    follow.save!
    redirect "/followers"
  else
    halt erb(:followers)
  end
end

get "/logout" do
  session.clear
  redirect "/"
end
