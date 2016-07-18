def stock_picker(arr)
	max_profit = -100000
	best_buy_index = nil
	best_sell_index = nil
	arr[0..-1].each_with_index do |higher_price,higher_index|
	arr[0..higher_index].each_with_index do |lower_price,lower_index| 
	#lower_index for all possible buy dates i.e dates before higher_index
	if (arr[higher_index]-arr[lower_index])>max_profit
		max_profit=arr[higher_index]-arr[lower_index]
		best_buy_index=lower_index
		best_sell_index=higher_index
	end

	end	
	end
	return [best_buy_index,best_sell_index]
end

puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect