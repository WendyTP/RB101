# tic tac toe walk through --reference implementation
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER ="O"



def prompt(message)
  puts "=> #{message}"
end  

# Step 1 : Set up and display the board:  
         # Need to have a way to pass in the marks on each square -- a sequence of data
         # Come up with a method & data structure to represent the board state

def display_board(brd)
  system "clear"
  puts "You are #{PLAYER_MARKER}, the computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts ""
end  

# creating a hash struture with 9 keys and values 
# key represents the position of square; value represent what will be marked on. (intialize an empty string)

def initialize_board   
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board 
end

# Step 2: Player turn

def empty_squares(brd)  # validation to see if chosen square is empty => inspecting the board only, not modify it
  brd.keys.select{|num| brd[num]== INITIAL_MARKER }   # returns [1,2,3,...]
end

def player_places_piece!(brd)  # player mark square - this method mutates variable board
  square = ""
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(",")}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def coumper_places_piece!(brd)  # computer mark square - this method mutates variable board
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

# Step 3: Create the main game loop

def board_full?(brd)
  empty_squares(brd).empty?
end  

# Step 4: determin the winner

def someone_won?(brd)  # since this method needs to return true or false, it makes sense to use the !! to change value to true/false
  !!detect_winnder(brd)
end

def detect_winnder(brd)  
  winning_lines = [[1,2,3],[4,5,6],[7,8,9], # rows
                   [1,4,7],[2,5,8],[3,6,9], # columns
                   [1,5,9],[3,5,7]]         # diagonals
  
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER && 
       brd[line[1]] == PLAYER_MARKER && 
       brd[line[2]] == PLAYER_MARKER
       return "Player"
    elsif brd[line[0]] == COMPUTER_MARKER && 
          brd[line[1]] == COMPUTER_MARKER && 
          brd[line[2]] == COMPUTER_MARKER
      return "Computer"
    end
  end  
  nil          
end  
loop do  # main game loop
  board = initialize_board     # This variable board will appear in the rest of the code, as it keeps track of the state of board

  loop do
    display_board(board)
    player_places_piece!(board)  # We pass in the board hash, the modification on hash & its element will mutate the local board variable
    break if someone_won?(board) || board_full?(board)
    coumper_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    
  end
  display_board(board)


  if someone_won?(board)
    prompt "#{detect_winnder(board)} won!"
  else 
    prompt "It's a tie!"
  end
  
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end
prompt "Thanks for playing! Goodbye!"
