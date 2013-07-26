require '../dvc-sinatra.rb'

get "/" do
  @entries = EncyclopediaEntry.all
  halt erb(:index)
end

get "/entries/:name" do
  id = params[:name]
  @entry = EncyclopediaEntry.find(id)
  halt erb(:show)
end