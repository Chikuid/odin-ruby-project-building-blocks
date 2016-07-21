class TicTacToe

	@@win_combinations =[[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

	def initialize(player1,player2)
		@switch = true
		@board = []

		#intializing board 1-D array to store current state of board
		#index on @board = 3*r + c where r is row number and c is column number
		@player1 = Player.new(player1,"O")
		@player2 = Player.new(player2,"X")
		puts "Welcome #{player1}! and #{player2}! #{player1}'s symbol is O and #{player2}'s symbol is X. When your turn is called "\
		"simply enter the place you want to put your symbol i.e. enter digits between 1-9 where counting starts from first element and ends at last element"

	end
public
	def start
 		puts "The board's positions configuration is as follows"
 		@board = []
 		for index in 1..9 do
 			@board<<index
 		end
 		display
 		print "This is #{turn(@switch).name}'s turn. #{turn(@switch).name}'s symbol is #{turn(@switch).symbol} and "
 		@switch = !@switch
 		print " #{turn(@switch).name}'s symbol is #{turn(@switch).symbol}. "
 		9.times do |index|
 			@board[index] = "-"
 		end
 		@player1.positions = []
 		@player2.positions = []
 		loop do
 			nextturn
 			break if check_win!=0
 			break if boardfull
 		end
 		ask_for_next_game
 	end
private
	class Player
		
		def initialize(name,symbol)
			@name = name
			@symbol = symbol
			@positions = []
		end
		attr_accessor :name, :symbol, :positions
	end
	def display # display current status of our board in a nice format
 		3.times do |row|
 			3.times do |column|
 				if column<2
 					print " #{@board[3*row + column]} |"
 				else
 					print " #{@board[3*row +column]} \n"
 				end
 			end
 			puts "---+---+---" if row<2
 		end
 	end
 	def turn(inp) #a method to switch between player 1 and 2 relating player1 and player2 with @switch
 		if inp==true
 			@player1
 		else
 			@player2
 		end
 	end



 	def check_win
 		flag = 0
 		@@win_combinations.each do |x| 
 			flag = 1 if x-@player1.positions==[]
 			flag = 2 if x-@player2.positions==[]
 		end
 		if flag==1
 			puts "#{@player1.name} is victorious! Congratulations! #{@player1.name}!"
 		elsif flag==2
 			puts "#{@player2.name} is victorious! Congratulations! #{@player2.name}!"
 		end
 		return flag
 	end
 	def ask_for_next_game
 		puts "Do you want to play another game?(Y/N)"
 		wish = gets.chomp
 		if wish == "y" || wish == "Y"
 			@switch = !@switch #this is just to take care that starting player at the end is not always same
 			start
 		end
 	end
 	def boardfull  #for checking if the board is full or not returns true if no position is remaining
 		@board.none?{|x| x=="-"}
 	end

 	def nextturn
 		loop do
 			puts "This is #{turn(@switch).name}'s turn Please enter a number between 1-9"
 			s = gets.chomp
 			s = s.to_i
 			if s.between?(1,9)
 				if @board[s-1] == "-"
 					@board[s-1] = turn(@switch).symbol
 					turn(@switch).positions<<s
 					display
 					@switch = !@switch
 					break
 				else
 					puts "That position is already occupied"
 				end
 			else
 				puts "Are you nuts! Enter a number between 1-9 please!"
 			end
 		end

 	end



 end


t=TicTacToe.new("Gaara","Jagga") #sample for showing use
t.start


