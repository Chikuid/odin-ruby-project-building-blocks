def bubble_sort_by arr
	l=arr.size-2
	swap=10 #giving swap a value 10 because I love Messi!
	while swap!=0
		swap=0
		for i in 0..l
			x=yield(arr[i],arr[i+1]) if block_given? #only for the cases when block is given 
			x||= arr[i].length-arr[i+1].length #giving x a default value if block is not given
			if  x > 0
				arr[i],arr[i+1]=arr[i+1],arr[i]
				swap+=1
			end

		end
		l-=1 #substracting becaue elements at the right side are now sorted
	end
	return arr
end

x =	bubble_sort_by(["hi","hello","hey"]) do |left,right|
		left.length-right.length
		end
p x