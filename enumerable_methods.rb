module Enumerable
	def my_each
		return self unless block_given?
		for i in 0...self.size
			yield (self[i])
		end
	end
	def my_each_with_index
		return self unless block_given?
		for i in 0...self.size
			yield(self[i],i)
		end
	end
	def my_select
		return self unless block_given?
		array = []
		self.my_each{|x| array.push(x) if yield(x) }#using my_each to iterate through elements
													#my_each yields to my_select which then yields to 
													#whoever called my_select and run the block present there
													#if it returns truthy value it pushes that element into array
		return array
	end
	def my_all?
		if block_given?
			self.my_each {|x| return false unless yield(x) }
		else
			self.my_each{|x| return false unless x}
		end
		true
	end
	def my_any?
		if block_given?
			self.my_each{|x| return true if yield(x)}
		else
			self.my_each{|x| return true if x}
		end
		false
	end
	def my_none?
		if block_given?
			self.my_each{|x| return false if yield(x)}
		else
			self.my_each{|x| return false if x}
		end
		true
	end
	def my_count(obj=nil)
		count = 0
		if obj==nil
			if block_given?
				self.my_each {|x| count+=1 if yield(x)}
				return count
			else
				return self.size
			end
		else
			self.my_each{|x| count+=1 if x==obj}
			return count
		end
	end
	def my_map
		return self unless block_given?
		array =[]
		self.my_each{|x| array.push(yield(x)) }
		return array
	end
	def my_inject(obj=nil)
		if obj==nil
			pass = self[0]
			self.my_each{|x| pass = yield(pass,x)}
			return pass
		else
			pass = obj
			self.my_each{|x| pass = yield(pass,x)}
			return pass
		end
	end
	def multiply_els
		self.my_inject{|product,element| product*element}
	end

	def my_map_with_proc(&proc)
		array =[]
		self.my_each{|x| array.push(proc.call(x))}
		return array
	end


end


