def fibs(n)
	a =[1,1]
	for i in 1...n-1
		temp = a.size
		sum = a[temp-1] + a[temp-2]
		a<<sum
	end
	return a
end
puts fibs(10).inspect



def fibs_rec (num,a=[1,1])
	return a if num<3
	a<<(a[-1] + a[-2])
	fibs_rec(num-1,a)
end
puts fibs_rec(10).inspect