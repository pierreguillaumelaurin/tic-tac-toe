class Board
  attr_accessor :player

  def initialize(player1_name, player2_name, n_of_columns, n_of_rows)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @n_of_rows = n_of_rows
    @n_of_columns = n_of_columns
    @board = Array.new(n_of_columns){Array.new(n_of_rows,"_")}
  end

  def show_board

  	def show_turn
  	  """prints a line with the turn number and the players turn"""
    end
    
  	def show_control
  	  """prints a line on top of the board to help the players identify the cases"""
      print "\s\s\s"
	  (97..@n_of_columns+96).each {|x| print "#{x.chr}"+"\s\s\s\s"}
	  print "\n"
    end
    """main method"""
  	i = 0
  	#show_turn
    show_control
	while i < @board.length
	  print "#{i+1}#{@board[i]}\n"
      i +=1
	end
	"""/main method"""
  end

  def player_move(turn)
	puts "Select your next move by inserting first the number associated to the row and then the letter /
	associated to the column"
	set_controls
	move = gets
	if controls.has_key?(move) == true
	  controls[move].value
	else
		"Sorry, either you did not enter the right the case you chose is already taken"
	end
    def select_player(player)
  	  return player
    end

  def set_controls
	  """creates a dictionary to associate empty cases with control options"""
	controls = Hash.new
	@board.each_with_index do |column, i_of_c|
		letter = 97
		column.each_with_index do |row, i_of_r| 
		  if @board[i_of_c][i_of_r] == "_"
			controls["#{i_of_c+1}#{letter.chr}"] = [@board[i_of_c][i_of_r], i_of_c, i_of_r]
			letter += 1
		  end
		end
	puts controls
	end
  end
  end
end


class Player
  attr_accessor :name
	
  def initialize(name)
	@name = name
  end
end

jeu = Board.new('Arthur', 'Bertrand', 3, 3)
jeu.show_board
jeu.player_move

