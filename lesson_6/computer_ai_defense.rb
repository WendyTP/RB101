=begin
request: 
ai defense
if player marks 2 squares in a row, the computer will defend the 3rd square.
If no immediate threat, computer pick random square
ai offense
if the computer already has 2 in a row, then fill in the 3rd square, 
=end

# ai defense & offense move

def find_at_risk_square(line,brd,marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select{ |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def coumper_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line,brd,COMPUTER_MARKER)
    break if square
  end
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line,brd,PLAYER_MARKER)
      break if square
    end
  end
  if !square
    if empty_squares(brd).include?(5)
      square = 5
    else
      square = empty_squares(brd).sample
    end
  end
  brd[square] = COMPUTER_MARKER
end


# first attempt for ai defense move
=begin
def find_at_risk_square(brd)
  square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      square = brd.select{ |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
      break
    end
  end  
  square
end



def coumper_places_piece!(brd)
  if find_at_risk_square(brd)
    square = find_at_risk_square(brd)
  else
    square = empty_squares(brd).sample 
  end
  brd[square] = COMPUTER_MARKER
end
=end