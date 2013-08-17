require '../dvc-sinatra.rb'

get "/" do
	halt erb(:index)
end

post "/" do
	if params[:color] != ""
		team	= Team.new
		team.color = params[:color]
		team.save!
		redirect "/"
	else
		redirect "/"
	end
end

get "/team/:color" do
	halt erb(:team)
end

post "/team/:color" do
	if params[:member] != ""
		member			= Member.new
		member.team_id 	= Team.where(color: params[:color]).first.id
		member.name		= params[:member]
		member.save!
		redirect "/team/#{params[:color]}"
	else
		redirect "/team/#{params[:color]}"
	end
end