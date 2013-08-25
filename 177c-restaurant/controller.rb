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
			order.has_paid = false
			order.save!
			redirect "/order/#{order.id}"
		end
	end
	
end

get "/order/:order_number" do
	if Order.find(params[:order_number]).has_paid == true
		redirect "/"
	end
	@order = Order.find(params[:order_number])
	@table = @order.table
	halt erb(:order)
end

post "/order/:order_number" do
	@order = Order.find(params[:order_number])
	@table = @order.table
	if params[:commit] == "Add entree"
		if params[:chair].to_i > @table.number_of_chairs
			flash.now[:error] = "Not a valid chair number."
			halt erb(:order)
		end
		if params[:entree] == nil
			flash.now[:error] = "No entree selected."
			halt erb(:order)
		end
		line_item = LineItem.new
		line_item.entree_id = params[:entree]
		line_item.chair = params[:chair]
		line_item.quantity = 1
		line_item.order_id = @order.id
		line_item.line_price = Entree.find(line_item.entree_id).price
		line_item.save!
		@order.total_price = @order.total_price + line_item.line_price
		@order.save!
	end
	if params[:commit] == "Pay and close"
		@order.has_paid = true
		@order.save!
		redirect "/"
	end
	halt erb(:order)
end