require '../dvc-sinatra.rb'

get "/" do
  @cities = City.all
  halt erb(:index)
end

get "/cities/:id" do
  id = params[:id]
  @city = City.find(id)
  halt erb(:show)
end
