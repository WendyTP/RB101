# Assignment : Twenty-One Bonus
# def assgning_card : to de-compose -- mutation?
=begin
High level pseudo-code:
  1. Initialize cards
  2. Player is assigned randomly 2 cards
  3. Dealer is assigned randomly 2 cards
  4. Dealer reaveals only one of the 2 cards to the player
  5. Player's turn: player decides hit or stay
    - repeat assign cards if hit, until bust or "stay"
  6. If player bust, dealer wins
  7. Dealer's turn:
    - hit until total >= 17
  8. If dealer bust, player wins
  9. Compare cards if both stay , and declare winner
Data:
  deck : hash
  player_cards = array
  dealer_cards = array
=end

BLACKJACK_POINTS = 21
DEALER_HIT_LIMIT = 17

def clear_screen
  system 'clear'
end

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  new_deck = {}
  [:spade, :hearts, :clubs, :diamonds].each do |suit|
    new_deck[suit] = [2, 3, 4, 5, 6, 7, 8, 9, 10,
                      "jack", "queen", "king", "ace"]
  end
  new_deck
end

def assigning_card!(dec)
  select_suit_type = dec.keys.sample
  selected_suits = dec[select_suit_type]
  assigned_card = selected_suits.sample
  selected_suits.delete(assigned_card)
  if selected_suits.empty?
    dec.delete(select_suit_type)
  end
  assigned_card
end

def total(cards)
  value = 0
  cards.each do |card|
    if card == "ace"
      value += 11
    elsif ["jack", "queen", "king"].include?(card)
      value += 10
    else
      value += card
    end
  end

  cards.count("ace").times do
    value -= 10 if value > 21
  end
  value
end

def player_turn_choice
  answer = ""
  loop do
    prompt "hit or stay? ('h' for hit; 's' for stay)"
    answer = gets.chomp.downcase
    break if ['h', 's'].include?(answer)
    prompt "Invalid answer. Please try again."
  end
  answer
end

def busted?(cards_total_value)
  cards_total_value > BLACKJACK_POINTS
end

def play_again?
  answer = ""
  loop do
    prompt "Play again? ('y' to continue; 'n' to quit)"
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
    prompt "Invalid answer. Please try again"
  end
  answer == "y"
end

def compare_result(player_total, dealer_total)
  if player_total > BLACKJACK_POINTS
    :player_busted
  elsif dealer_total > BLACKJACK_POINTS
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie
  end
end

def display_result(player_total, dealer_total)
  result = compare_result(player_total, dealer_total)

  case result
  when :player_busted then prompt "You busted! Dealer won!"
  when :dealer_busted then prompt "Dealer busted! You won!"
  when :player then prompt "You won!"
  when :dealer then prompt "Dealer won!"
  when :tie then prompt "It's a tie!"
  end
end

def display_grand_result(player_cards, dealer_cards, player_total, dealer_total)
  puts "========="
  prompt "Player has #{player_cards}, for a total of #{player_total}"
  prompt "Dealer has #{dealer_cards}, for a total of #{dealer_total}"
  puts "========="
  display_result(player_total, dealer_total)
end

def display_current_score(scores)
  scores.each do |person, score|
    prompt"#{person.to_s} current score is #{score}"
  end
end

def first_reaches_five_wins(scores)
  if scores[:player] >= 5
    "Player"
  elsif scores[:dealer] >= 5
    "Dealer"
  else
    nil
  end
end    

scores = {player: 0, dealer: 0}

loop do # main loop
  clear_screen
  prompt "Welcome to Twenty-One!"

  # initialize
  deck = initialize_deck

  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << assigning_card!(deck)
    dealer_cards << assigning_card!(deck)
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "Player has #{player_cards[0]} and #{player_cards[1]}, "\
         "for a total of #{player_total}"

  # player turn
  player_turn = nil
  loop do
    player_turn = player_turn_choice
    if player_turn == "h"
      player_cards << assigning_card!(deck)
      player_total = total(player_cards)
      prompt "You chose to hit"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end
    break if player_turn == "s" || busted?(player_total)
  end

  if busted?(player_total)
    display_grand_result(player_cards, dealer_cards, player_total, dealer_total)
    scores[:dealer] += 1
    display_current_score(scores)

    if first_reaches_five_wins(scores)
      prompt "#{first_reaches_five_wins(scores)} reaches 5 wins! Game over!"
      break
    end

     play_again? ? next : break

  else
    prompt "You chose to stay at #{player_total}."
  end

  clear_screen

  # dealer turn
  prompt "Dealer's turn now ..."
  loop do
    break if dealer_total >= DEALER_HIT_LIMIT

    prompt "dealer hits..."
    dealer_cards << assigning_card!(deck)
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now #{dealer_cards}"
    prompt"Dealer's total is now #{dealer_total}"
  end

  if busted?(dealer_total)
    display_grand_result(player_cards, dealer_cards, player_total, dealer_total)
    scores[:player] += 1
    display_current_score(scores)

    if first_reaches_five_wins(scores)
      prompt "#{first_reaches_five_wins(scores)} reaches 5 wins! Game over!"
      break
    end

    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both parties stay
  prompt "Both parties stay..."
  display_grand_result(player_cards, dealer_cards, player_total, dealer_total)
  winner = compare_result(player_total, dealer_total)
  if winner != :tie
    scores[winner] += 1
  end
  display_current_score(scores)

  if first_reaches_five_wins(scores)
    prompt "#{first_reaches_five_wins(scores)} reaches 5 wins! Game over!"
    break
  end

  break unless play_again?
end # main loop end

prompt "Thanks for playing. Goodbye!"
