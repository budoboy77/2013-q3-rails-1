require '../dvc-sinatra.rb'

get "/" do
	@tables = Table.all
	@orders = Order.all
	halt erb(:main)	
end

post "/" do
	@tables = Table.all
	@orders = Order.all
	@tables.each do |table|
		if params[:commit] == "Occupy table #{table.id}"
			order = Order.new
			order.table_id = table.id
			order.total_price = 0.0
			order.has_paid = "f"
			order.save!
			redirect "/order/#{order.id}"
		end
	end
	
end

get "/order/:order_number" do
	@table = Order.find(params[:order_number]).table
	halt erb(:order)
end

post "/order/:order_number" do
	if params[:commit] == "Add entree"
		order
end