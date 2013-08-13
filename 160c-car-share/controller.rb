require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do 
  @username = params[:username]
  halt erb(:login)
end

post "/login" do
  @username = params[:username]

  [1, 2].each do |member_id|
    member = Member.find(member_id)
    if @username == member.username
      if params[:password] == member.password
        redirect "/reservations/#{member_id}"
      else
        @error = "Incorrect Password"
        halt erb(:login)
      end
    end
  end
  
  @error = "Unknown Username"
  halt erb(:login)

end

get "/reservations/:id" do
  member = Member.find(params[:id])
  @name = member.username
  halt erb(:reservations)
end
