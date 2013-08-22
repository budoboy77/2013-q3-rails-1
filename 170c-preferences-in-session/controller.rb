require '../dvc-sinatra.rb'

get "/" do
  @color = session[:color]
  @number = session[:number]
  @letter = session[:letter]
  
  halt erb(:main)
end

post "/" do
  session[:color] = params[:color]
  session[:letter] = params[:letter]
  session[:number] = params[:number]

  redirect "/"
end

get "/logout" do
  session.clear
  redirect "/"
end
