class Node
	attr_accessor :value, :next_node

	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end
end

class LinkedList
	def initialize
		@head = Node.new("head", nil )
	end

	def append(value)
		self.tail.next_node = Node.new(value, nil)
	end
	def prepend(value)
		@head.next_node = Node.new(value, @head.next_node)

	end
	def size
		node = @head
		size = 0
		while node.next_node
			node = node.next_node
			size += 1
		end
		size
	end
	def at(index)
		if index <= self.size
				position = 0
				node = @head
				while position != index
					position += 1
					node = node.next_node
				end
				node
		else
			puts "Given index does not exist"
			nil
		end
	end


	def head
		@head
	end
	def tail
		node = @head
		while node.next_node != nil
			node = node.next_node
		end
		node
	end
	def pop
		size = self.size
		self.at(size-1).next_node = nil
	end
	def contains?(value)
		node = @head
		while node.next_node
			if node.value == value
				return true
			end
			node = node.next_node
		end
		false
	end
	def find(value)
		node = @head
		index = 0
		while node.next_node
			return index if node.value == value
			node = node.next_node
			index += 1
		end
	end
	def to_s
		string = ""
		node = @head
		while node.next_node
			string += "( " + node.value.to_s + " ) ->"
			node = node.next_node
		end
		string += " nil"
		string
	end
	def insert_at(index)
		puts "Enter the data you want to input"
		data = gets.chomp
		self.at(index-1).next_node = Node.new(data,self.at(index))
	end
	def remove_at(index)
		self.at(index-1).next_node = self.at(index+1)
	end

end
a = LinkedList.new
a.append("Gaara")
a.append("is")
a.append("a")
a.append("Psychopath")
a.prepend("True")
a.prepend("Not")


puts "At index 3: #{a.at(3).value}"


puts "Head: #{a.head.next_node.value} Tail: #{a.tail.value} Size: #{a.size}"

puts "Starting pop"

a.pop

puts "After popping Tail: #{a.tail.value} Size: #{a.size}"

puts "Checking for Gaara: #{a.contains?("Gaara")} Checking for Aqua: #{a.contains?("Aqua")} index of Gaara: #{a.find("Gaara")}"

puts a.to_s

puts "Inserting data at index 4"

a.insert_at(4)

puts a.to_s

a.remove_at(2)

puts a.to_s