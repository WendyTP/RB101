VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]
SIMPLIFIED_VALID_CHOICES = ["r", "p", "sc", "l", "sp"]

def prompt(message)
  puts("=> #{message}")
end

def get_user_input
  user_input = ""
  loop do
    prompt("Enter r for rock, p for paper, sc for scissor,
    l for lizard, and sp for spock")
    user_input = gets.chomp.downcase

    if SIMPLIFIED_VALID_CHOICES.include?(user_input)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  user_input
end

def convert_user_input(input)
  case input
  when "r" then "rock"
  when "p" then "paper"
  when "sc" then "scissors"
  when "l" then "lizard"
  when "sp" then "spock"
  end
end

def win?(first, second)
  (first == "scissors" && (second == "paper" || second == "lizard")) ||
    (first == "paper" && (second == "rock" || second == "spock")) ||
    (first == "rock" && (second == "lizard" || second == "scissors")) ||
    (first == "lizard" && (second == "spock" || second == "paper")) ||
    (first == "spock" && (second == "scissors" || second == "rock"))
end

def display_result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

prompt("Hello, welcome to rock-paper-scissors-lizard-spock game!")

game_rule_prompt = <<-RULES
  1. This is the extended version of rock-paper-scissors game.
  2. You will play with the computer. Each win gains 1 point,
     and the frist one reaches 5 points will be the winner.
  3. The following are the rules:
     * scissors cuts paper ; paper covers rock ;
     * rock crushes lizard ; lizard poisons spock ;
     * spock smashes scissors ; scissors decapitates lizard ;
     * lizard eats paper ; paper disproves spock ;
     * spock vaporizes rock ; rock crushes scissors

RULES

prompt(game_rule_prompt)

loop do # main loop
  prompt("Start the game: user: 0 point; computer: 0 point.")

  user_score = 0
  computer_score = 0

  while user_score < 5 && computer_score < 5 # game loop
    user_input = get_user_input
    choice = convert_user_input(user_input)
    computer = VALID_CHOICES.sample

    prompt("You chose #{choice}; Computer chose: #{computer}")
    prompt(display_result(choice, computer).to_s)

    if win?(choice, computer)
      user_score += 1
    elsif win?(computer, choice)
      computer_score += 1
    end

    prompt("your current score is #{user_score};
    computer current score is #{computer_score}")
  end # game loop end

  if user_score > computer_score
    prompt("You are the grand winner!")
  elsif computer_score > user_score
    prompt("Computer is the grand winner!")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end # main loop end

prompt("Thank you for palying. Good bye!")
