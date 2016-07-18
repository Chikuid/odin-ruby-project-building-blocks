
def shift_is_real(x,y,n) 
#x = char to be shifted
#y = l/L for left shift r/R for right shift
#n = how much shift we want
	if(y=="L"||y=="l")
		if(x>='a' && x<='z')
			temp= x.ord-'a'.ord
			if(temp<n)
				x=(x.ord+(26-n)).chr
			elsif 				
				x=(x.ord-n).chr
			end
		elsif(x>='A' && x<='z')
			temp= x.ord-'A'.ord
			if(temp<n)
				x=(x.ord+(26-n)).chr
			elsif
				x=(x.ord-n).chr
			end
		end
	elsif(y=="R"||y=="r")
		if(x>='a' && x<='z')
			temp= 'z'.ord-x.ord
			if(temp>=n)
				x=(x.ord+n).chr
			elsif
				x=(x.ord-(26-n)).chr
			end
		elsif(x>='A' && x<='Z')
			temp= 'Z'.ord-x.ord
			if(temp>=n)
				x=(x.ord+n).chr
			elsif
				x=(x.ord-(26-n)).chr
			end
		end
	end
	return x
end
def caesar_cipher(input,shift_amount,shift_direction="r")
intput_array=input.scan(/\w/).uniq
#.uniq is used becaue this array is later used to calculate a hash for referring rather than shifting same letters again and again
h=Hash.new 
#Key - character befor shifting, Value - Character after shifting
#Hash is used so we dont calculate value after shifting for same letter multiple times
intput_array.each {|element| 

	h[element]= shift_is_real(element,shift_direction,shift_amount)
}
#value stored in hash now
output = input.scan(/./).collect{|element|
if h.key?(element)
	h[element]
else
	element
end
}.join

puts output 
end
puts "Enter a string to be encrypted"
input = gets.chomp
puts "What kind of shit do you want?(L/R)"
shift_direction = gets.chomp
puts "What is the amount of shift you want?"
shift_amount_string = gets.chomp
shift_amount = shift_amount_string.to_i%26
caesar_cipher(input,shift_amount,shift_direction)

caesar_cipher("What a string!", 5)
#output seeked in the odin project

