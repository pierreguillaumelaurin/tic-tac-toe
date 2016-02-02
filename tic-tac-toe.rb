class Board
  attr_accessor :player

  def initialize(player1_name, player2_name, n_of_columns, n_of_rows)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @n_of_rows = n_of_rows
    @n_of_columns = n_of_columns
    @board = Array.new(n_of_columns){Array.new(n_of_rows,"_")}
  end

  def show_board(turn)

  	def show_turn(turn)
  	  """prints a line with the turn number and the players turn"""
      if turn % 2 != 0
        puts "Player 1's turn, CHOOSE WISELY!"
      else
        puts "Player 2's turn, CHOOSE WISELY!"
      end
    end
    
  	def show_control
  	  """prints a line on top of the board to help the players identify the cases"""
      print "\s\s\s"
	    (97..@n_of_columns+96).each {|x| print "#{x.chr}"+"\s\s\s\s"}
	    print "\n"
    end
    """main method"""
  	i = 0
  	show_turn(turn)
    show_control
	  while i < @board.length
	    print "#{i+1}#{@board[i]}\n"
      i +=1
	  end
	"""/main method"""
  end
  
  def update(turn, move)

    def set_controls
    """creates a dictionary to associate empty cases with control options"""
    controls = Hash.new
    @board.each_with_index do |column, i_of_c|
      letter = 97
      column.each_with_index do |row, i_of_r| 
        if @board[i_of_c][i_of_r] == "_"
          controls["#{i_of_c+1}#{letter.chr}"] = [@board[i_of_c][i_of_r], i_of_c, i_of_r]
          
          end
        letter += 1
      end
    end
    print controls
    controls
    end
  
  controls = set_controls.to_h
  puts controls.keys
	if controls.has_key?(move) == true && turn % 2 != 0
    puts 'BON'
	  @board[controls[move][1]][controls[move][2]] = 'O'
  elsif controls.has_key?(move) == true && turn % 2 == 0
    puts 'UNI'
    @board[controls[move][1]][controls[move][2]] = 'X'
  else
		print "Sorry, YOU MISSED YOUR TURN BY ENTERING THE WRONG CASE"
	end

  end


  def winner?
    def check_rows
      @board.each_with_index do |row|
        if row.all?{|i| i == 'O' } || row.all?{|i| i == 'X' }
          return true
        end
      end
    end

    def check_columns
      column_repository = {}
      @board.each do |row|
        row.each_with_index do |i, index|
        if column_repository[index] == nil 
          column_repository[index] = [i]  
        else 
          column_repository[index].push(i)
        end
        end
      puts "column rep: #{column_repository}"
      end
      column_repository.values.each do |column|
      if column.all?{|i| i == 'O'}  || column.all?{|i| i == 'X'}
        return true
        end
      end
    end

    def check_diagonals
      def check_first
        first_diagonal = []
        counter = 0
        @board.each do |row|
          first_diagonal.push(row[counter])
          counter += 1
        end
        puts "first diagonal: #{first_diagonal}"
        if first_diagonal.all?{|i| i == 'O'} || first_diagonal.all?{|i| i == 'X'}
          return true
        end
      end
      def check_second
        second_diagonal = []
        counter = -1
        @board.each do |row|
          second_diagonal.push(row[counter])
          counter -= 1
        end
        puts "second diagonal: #{second_diagonal}"
        if second_diagonal.all?{|i| i == 'O' || i == 'X'}
          return true
        end
      end
    check_first
    check_second
    end
    
    # def check_tie
    #   @board.all? do|rows|
    #     answers = []
    #     if rows.any?{|i| i =='_'} == false
    #       answers.push(false)
    #     end
        
    #   end
    # end
    #checks if any of the winning or tie conditions are fulfilled
    if check_rows == true || check_columns == true || check_diagonals == true
      return true
    # elsif check_tie == false
    #   return false
    else
      puts 'GAME CONTINUES'
    end
  end

  def winner(turn)
    if turn % 2 != 0
      winner = 1
    else
      winner = 2
    end
    puts "CONGRATULATIONS PLAYER #{winner}, YOU WON!!!!!"
  end
end


class Player
  attr_accessor :name
	
  def initialize(name)
	@name = name
  end
end


