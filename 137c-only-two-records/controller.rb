require '../dvc-sinatra.rb'

get "/" do
  @bracelet_lines = BraceletLine.order("id").all
  halt erb(:root)
end

get "/line1" do
  @bracelet_line = BraceletLine.find(1)
  halt erb(:edit)
end

get "/line2" do
  @bracelet_line = BraceletLine.find(2)
  halt erb(:edit)
end