require './tic-tac-toe'

continue = true
turn = 1
puts "WELCOME TO MY SCALABLE TIC-TAC-TOE GAME, SELECT YOUR NEXT MOVE BY SELECTING FIRST THE NUMBER ASSOCIATED TO THE ROW AND THEN \
THE LETTER ASSOCIATED TO THE COLUMN!!!!!"
jeu = Board.new('Arthur', 'Bertrand', 3, 3)

until continue == false
  jeu.show_board(turn)
  player_move = String(gets.chomp)
  jeu.update(turn, player_move)
  print jeu.winner?
  if jeu.winner? == true
    print 'yoliiiii!'
    jeu.winner(turn)
  	continue = false
  elsif jeu.winner? == false
    print 'NOOOOOO IT IS A TIE! BETTER LUCK NEXT TIME'
    continue = false
  end
  turn += 1
  puts "continue: #{continue}"
end

