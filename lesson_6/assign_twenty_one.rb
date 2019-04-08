# Assignment : Twenty-One
# def assgning_card : to de-compose -- mutation
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

def busted?(cards)
  total(cards) > 21
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

def compare_final_result(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total == dealer_total
    "tie"
  elsif player_total > dealer_total
    "player"
  else
    "dealer"
  end
end

def clear_screen
  system 'clear'
end

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

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "Player has #{player_cards[0]} and #{player_cards[1]},
          for a total of #{total(player_cards)}"

  # player turn
  player_turn = nil
  loop do
    player_turn = player_turn_choice
    if player_turn == "h"
      player_cards << assigning_card!(deck)
      prompt "You chose to hit"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end
    break if player_turn == "s" || busted?(player_cards)
  end

  if busted?(player_cards)
    prompt "You busted! Dealer won!"
    play_again? ? next : break

  else
    prompt "You chose to stay at #{total(player_cards)}."
  end

  clear_screen

  # dealer turn
  prompt "Dealer's turn now ..."
  loop do # break if busted or stay
    break if total(dealer_cards) >= 17

    prompt "dealer hits..."
    dealer_cards << assigning_card!(deck)
    prompt "Dealer's cards are now #{dealer_cards}"
    prompt"Dealer's total is now #{total(dealer_cards)}"
  end

  if busted?(dealer_cards)
    prompt "Dealer busted! You won!"
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  # both parties stay --> compare final result
  prompt "========="
  prompt "Player has #{player_cards}, for a total of #{total(player_cards)}"
  prompt "Dealer has #{dealer_cards}, for a total of #{total(dealer_cards)}"
  prompt "========="

  game_result = compare_final_result(player_cards, dealer_cards)
  case game_result
  when "tie" then prompt "It's a tie."
  else
    prompt "#{game_result} won!"
  end

  break unless play_again?
end # main loop end

prompt "Thanks for playing. Goodbye!"
