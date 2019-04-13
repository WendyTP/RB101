# tic tac toe bonus features
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
PLAYING_ORDERS = ["Player", "Compuer", "Choose"]
WINNING_POINTS = 5

def prompt(message)
  puts "=> #{message}"
end

def clear_terminal
  system('clear') || system('cls')
end

def welcome
  "Welcome to tic tac toe!
  The first to score #{WINNING_POINTS} points win.
  Let's begin!"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear_terminal
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
# rubocop:ensable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator_sym = ", ", separator_word = "or")
  case arr.size
  when 0 then ""
  when 1 then arr.first
  when 2 then arr.join(" or ")
  else
    arr[-1] = "#{separator_word} #{arr.last}"
    arr.join(separator_sym)
  end
end

def player_choose_playing_order
  choice = ""
  loop do
    prompt "Choose who playes first? (type 'c' for computer; 'p' for player)"
    choice = gets.chomp.downcase
    break if choice == "c" || choice == "p"
    prompt "Invalid choice. Please try again."
  end
  if choice == "c"
    return "Computer"
  else
    return "Player"
  end
end

def first_player
  case PLAYING_ORDERS.sample
  when "Choose" then player_choose_playing_order
  when "Player" then "Player"
  else "Computer"
  end
end

def valid_square_input?(square)
  /^\d$/.match(square)
end

def player_places_piece(brd)
  square = ""
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp
    break if valid_square_input?(square) &&
             empty_squares(brd).include?(square.to_i)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square.to_i] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_offense_defense_move(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
  square
end

def computer_places_piece(brd)
  square = computer_offense_defense_move(brd, COMPUTER_MARKER)
  if !square
    square = computer_offense_defense_move(brd, PLAYER_MARKER)
  end
  if !square
    square = if empty_squares(brd).include?(5)
                5
              else
                empty_squares(brd).sample
              end
  end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  case current_player
  when "Player" then player_places_piece(brd)
  when "Computer" then computer_places_piece(brd)
  end
end

def alternate_player(current_player)
  current_player == "Player" ? "Computer" : "Player"
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def update_score(scores,brd)
  scores[detect_winner(brd)] += 1
end

def display_round_winner(brd)
  prompt "#{detect_winner(brd)} won!"
end

def display_tie
  prompt "It's a tie!"
end  

def display_current_score(scores)
  scores.each do |person, score|
    prompt"#{person} current score is #{score}"
  end
end

def match_winner(scores)
  if scores["Player"] >= WINNING_POINTS
    "Player"
  elsif scores["Computer"] >= WINNING_POINTS
    "Computer"
  else
    nil  
  end
end

def display_match_winner(scores)
  prompt "#{match_winner(scores)} reaches #{WINNING_POINTS} wins first! 
  Game over!"
end

def valid_playe_again_answer?(answer)
  answer == "y" || answer == "n"
end  

def play_again_answer
  answer = ""
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break if valid_playe_again_answer?(answer)
    prompt "Invalid answer.Type 'y' to continue or 'n' to exit."
  end
  answer
end

def display_goodbye
  prompt "Thanks for playing! Goodbye!"
end

clear_terminal
prompt "#{welcome}"
scoring = { "Player" => 0, "Computer" => 0 }

sleep(3)

loop do # main game loop
  board = initialize_board
  current_player = first_player

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
    
  end

  display_board(board)

  if someone_won?(board)
    display_round_winner(board)
    update_score(scoring,board)
  else
    display_tie
  end

  display_current_score(scoring)

  if match_winner(scoring)
    display_match_winner(scoring)
    break
  end

  break if play_again_answer == "n"
end

display_goodbye
