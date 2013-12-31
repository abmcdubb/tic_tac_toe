# This method prints the current gameboard so players can see what spaces are available
def print_board(gamespaces)
  puts
  print gamespaces[0].join('|')
  puts
  print gamespaces[3].join(' ')
  puts
  print gamespaces[1].join('|')
  puts
  print gamespaces[3].join(' ')
  puts
  print gamespaces[2].join('|')
  puts 
  puts
end 

# This method maps out all the winning combinations and sets value of the winner variable that is used in the loop below.  
# I'm sure there is a more condensed way to check for winners, but this is what I have.
# In addition, I made the x and o values capitalize the characters winning row to make the final board nicer/easier to look at
def check_for_winner(gamespaces, player)
  if gamespaces[0][0] == player && gamespaces[0][1] == player && gamespaces[0][2] == player
    puts
    puts 'You\'re a winner, Player' + player.upcase + '!'
    gamespaces[0][0] = player.upcase 
    gamespaces[0][1] = player.upcase 
    gamespaces[0][2] = player.upcase 
    winner = true
  elsif gamespaces[1][0] == player && gamespaces[1][1] == player && gamespaces[1][2] == player
    puts
    puts 'Winner, Winner, Chicken Dinner, Player ' + player.upcase + '!'
    gamespaces[1][0] = player.upcase 
    gamespaces[1][1] = player.upcase 
    gamespaces[1][2] = player.upcase 
    winner = true
  elsif gamespaces[2][0] == player && gamespaces[2][1] == player && gamespaces[2][2] == player
    puts
    puts 'Jugador ' + player.upcase + ' es el ganador!'
    gamespaces[2][0] = player.upcase 
    gamespaces[2][1] = player.upcase 
    gamespaces[2][2] = player.upcase 
    winner = true
  elsif gamespaces[0][0] == player && gamespaces[1][0] == player && gamespaces[2][0] == player
    puts
    puts 'You won, Player ' + player.upcase + '!'
    gamespaces[0][0] = player.upcase 
    gamespaces[1][0] = player.upcase 
    gamespaces[2][0] = player.upcase
    winner = true
  elsif gamespaces[0][1] == player && gamespaces[1][1] == player && gamespaces[2][1] == player
    puts
    puts 'Player ' + player.upcase + ' is the winner!'
    gamespaces[0][1] = player.upcase 
    gamespaces[1][1] = player.upcase 
    gamespaces[2][1] = player.upcase
    winner = true
  elsif gamespaces[0][2] == player && gamespaces[1][2] == player && gamespaces[2][2] == player
    puts
    puts 'You are the champion, Player ' + player.upcase + '!'
    gamespaces[0][2] = player.upcase 
    gamespaces[1][2] = player.upcase 
    gamespaces[2][2] = player.upcase
    winner = true
  elsif gamespaces[0][0] == player && gamespaces[1][1] == player && gamespaces[2][2] == player
    puts
    puts 'Congratulations, Player ' + player.upcase + '!'
    gamespaces[0][0] = player.upcase 
    gamespaces[1][1] = player.upcase 
    gamespaces[2][2] = player.upcase
    winner = true
  elsif gamespaces[0][2] == player && gamespaces[1][1] == player && gamespaces[2][0] == player
    puts
    puts 'Felicitaciones! Tu ganaste, Jugador ' + player.upcase + '!'
    gamespaces[0][2] = player.upcase 
    gamespaces[1][1] = player.upcase 
    gamespaces[2][0] = player.upcase
    winner = true
  else
    winner = false
  end
end

#This field alternates value between X and O
player = 'x'

#This is the array I've used to represent the gameboard
gamespaces = [[1,2,3],[4,5,6],[7,8,9],['_','_','_']]

#This variable is used in the check_for_winner method above and can end the loop/game below
winner = ''

#This variable alternates between players and can end the loop below.  
#It also plays a role in forcing the player to reenter their input, if invalid in addition to the else statement.  Although I only leraned that by accident.
turncount = 0

puts 'Welcome to your game of tic tac toe!'
puts

print_board(gamespaces)

puts
puts 'Player X goes first.' 

#This while loop determines most of the play.  
#It lasts for a maximum of 9 rounds, the amount of possible turns, or until someone hits 3 in a row
while turncount < 9 && winner != true
  puts 'Player ' + player.upcase + ', please select a number on the board to move your ' + player + ' into that space'
  move = gets.chomp.to_i

#each rule evaluates the user input as well as the existing data in the array.  
#If the space in the array is still a number, it updates that value with an x or an o.  If not, it forces you to replay your turn
#Each succesful move adds a 1 to the turncount

  if move == 1 && gamespaces[0][0] == 1
    gamespaces[0][0] = player
    turncount += 1
  elsif move == 2 && gamespaces[0][1] == 2
    gamespaces[0][1] = player
    turncount += 1
  elsif move == 3 && gamespaces[0][2] == 3
    gamespaces[0][2] = player
    turncount += 1
  elsif move == 4 && gamespaces[1][0] == 4
    gamespaces[1][0] = player
    turncount += 1
  elsif move == 5 && gamespaces[1][1] == 5
    gamespaces[1][1] = player
    turncount += 1
  elsif move == 6 && gamespaces[1][2] == 6
    gamespaces[1][2] = player
    turncount += 1
  elsif move == 7 && gamespaces[2][0] == 7
    gamespaces[2][0] = player
    turncount += 1
  elsif move == 8 && gamespaces[2][1] == 8
    gamespaces[2][1] = player
    turncount += 1
  elsif move ==9 && gamespaces[2][2] == 9
    gamespaces[2][2] = player
    turncount += 1
  else
    puts 'That is not a valid move.  Please select one of the numbers available on the gameboard below:'
  end

#This calls the check_for_winner method and updates the winner variable with true or false
  winner = check_for_winner(gamespaces, player)
  #add error message 
  
#end loop if the current player won the game
  break if winner == true

#adds a message to indicate game play is over, if all the moves have been taken and no one wins
  if turncount == 9
    puts
    puts 'No one wins. Game over, man. Game over.'
    break 
  end

#This counter alternates game play between player x and player o
  if turncount % 2 == 0
    player = 'x'
  else
    player = 'o'
  end

#Prints updated game board after each move
  print_board(gamespaces)
end

#prints board after final round
print_board(gamespaces)








