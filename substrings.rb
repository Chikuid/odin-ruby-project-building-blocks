def substrings(str,dictionary )
	str_array= str.scan(/\w+/)
	h= Hash.new(0)
	str_array.each do |word|
		0.upto(word.length-1) do |index_last|
			0.upto(index_last) do |index_first|
				if dictionary.include?(word[index_first..index_last].downcase)
					h[(word[index_first..index_last]).downcase]+=1
				end
			end
		end
	end



		puts h
	
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
    