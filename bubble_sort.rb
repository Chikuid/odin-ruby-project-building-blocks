def bubble_sort array
	length = array.size-1
	swap = 10 #initializing swap with a non negative number 
	while swap!=0
		swap=0 #if number of swaps in one iteration is zero then our array is already sorted
		1.upto(length) do |index|
			if array[index] < array[index-1]
				array[index-1],array[index] = array[index], array[index-1]
				swap+=1

			end

		end
	length-=1 #decreasing the length of next loop as element at index length is already in its position
	end
	return array
end



puts bubble_sort([4,3,78,2,0,2]).inspect()
