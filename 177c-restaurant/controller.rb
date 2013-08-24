require '../dvc-sinatra.rb'

get "/" do
	@tables = Table.all
	@orders = Order.all
	halt erb(:main)	
end