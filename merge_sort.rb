def merge(l,r,a)
	i = 0 
	j = 0
	k = 0
	while i<l.size && j<r.size
		if l[i]>r[j] 
			a[k] = r[j]  
			j+=1
		else
			a[k] = l[i]
			i+=1
		end
		k+=1
	end
	while i<l.size
		a[k] = l[i]
		i+=1
		k+=1
	end
	while j<r.size
		a[k] = r[j]
		j+=1
		k+=1
	end

	return a
end

def merge_sort a
	return a if a.size == 1
	left,right = a.each_slice( (a.size/2.0).round ).to_a
	l = merge_sort (left)
	r = merge_sort (right)

	merge(l, r , a)
	

	
end
puts merge_sort([12,8,9,4,2,7,100,80,45,5,23,45]).inspect