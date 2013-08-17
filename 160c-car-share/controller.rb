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
  @member = Member.find(params[:id])
  @cars = Car.order(:id).all
  @reserved_cars = Car.where(reserving_member_id: @member.id).order(:id).all
  halt erb(:reservations)
end

post "/reservations/:id" do
  if params[:commit] == "Logout"
    redirect '/login'
  end

  Car.all.each do |car|
    if params[:commit] == "Return car #{car.id}"
      car.reserving_member_id = nil
      car.save!
    end
  end

  Car.all.each do |car|
    if params[:commit] == "Reserve car #{car.id}"
      car.reserving_member_id = params[:id]
      car.save!
    end
  end

  redirect "/reservations/#{params[:id]}"

end