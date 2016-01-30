class Board
	attr_accessor :player

	def initialize(player1_name, player2_name)
		@player1 = Player.new(player1_name)
		@player2 = Player.new(player2_name)
		# @board = [['a','a','a'],['a','a','a'],['a','a','a']]
		@board = Array.new(3){Array.new(3, " ")}
	end

	def show_board
		i = 0
		while i <= @board.length
		    print "#{@board[i]}\n"
		    i +=1
		end
	end
end


class Player
	attr_accessor :name
	
	def initialize(name)
		@name = name
	end
end

jeu = Board.new('Arthur', 'Bertrand')
jeu.show_board