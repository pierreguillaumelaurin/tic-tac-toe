require './tic-tac-toe'

continue = true
turn = 1
puts "WELCOME TO MY GREAT GAME, SELECT YOUR NEXT MOVE BY SELECTING FIRST THE NUMBER ASSOCIATED TO THE ROW AND THEN \
THE LETTER ASSOCIATED TO THE COLUMN!!!!!"

while continue == true
  jeu = Board.new('Arthur', 'Bertrand', 3, 3)
  jeu.show_board
  jeu.update(turn)
  jeu.show_board
  if jeu.winner? == true
  	continue == false
  	jeu.winner
  end
  turn += 1
end

