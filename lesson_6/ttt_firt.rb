# My attempt to create the tic tac toe game --- 
# issue encountered: data type choice led to not able to find a way to determin winner 
# Display the initial empty 3 x 3 game baord.  (Sub-process)
horizontal_grid_line = "+ - + - + - +"
line1 =                "| 1 | 2 | 3 |"
line2 =                "| 4 | 5 | 6 |"
line3 =                "| 7 | 8 | 9 |"

game_board = ""
game_lines = [line1,line2,line3]
count = 0
while count < game_lines.size
  game_board += horizontal_grid_line + "\n"
  game_board += game_lines[count] + "\n"
  count += 1
end
    
game_board += horizontal_grid_line

game_board_numbers = %w(1 2 3 4 5 6 7 8 9)  # for recording which square is marked

#  Ask the user to mark a square  (Sub-process)
user_input = ""
loop do
  loop do
    puts "Please enter a number between 1- 9"
    user_input = gets.chomp
    break if (1..9).include?(user_input.to_i)
    puts "The input is not valid. Please try again."
  end
  break if game_board_numbers.include?(user_input)
  puts "This square is taken. Please try again."  
end

# Update the game board
game_board_numbers.delete(user_input)
game_board = game_board.gsub(user_input,"O")

# The computer marks a square    (Sub-process)
computer_input = game_board_numbers.sample

# Update the game board
game_board_numbers.delete(computer_input)
game_board = game_board.gsub(computer_input, "X")

puts game_board

# If winner, display winner


# If board is full, display tie
if game_board_numbers.empty?
  puts "Game over! It's tie!"

  


  
