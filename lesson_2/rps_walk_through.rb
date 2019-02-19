=begin
# Rock paper scissors game walk through
Game flow:
1. the user makes a choice
2. the computer makes a choice
3. the winner is displayed
4. continue the game?
=end

VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt(message)
  puts("=> #{message}")
end

def display_result(player, computer)
  if (player == "rock" && computer == "scissors") ||
     (player == "paper" && computer == "rock") ||
     (player == "scissors" && computer == "paper")
    prompt("You won!")
  elsif (computer == "rock" && player == "scissors") ||
        (computer == "paper" && player == "rock") ||
        (computer == "scissors" && player == "paper")
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do # main loop
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose: #{computer}")

  display_result(choice, computer)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end # main loop end

prompt("Thank you for palying. Good bye!")
