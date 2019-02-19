require 'yaml'
LANGUAGE = 'en'
MESSAGES = YAML.load_file('rps_bonus_feature.yml')

VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]
USER_VALID_CHOICES = ["r", "p", "sc", "l", "sp"]
WINNING_CONDITIONS = { "scissors" => ["paper", "lizard"],
                       "paper" => ["rock", "spock"],
                       "rock" => ["lizard", "scissors"],
                       "lizard" => ["spock", "paper"],
                       "spock" => ["scissors", "rock"] }

def message(key)
  MESSAGES[LANGUAGE][key]
end

def prompt(message)
  puts("=> #{message}")
end

def receive_user_input
  user_input = ""
  loop do
    prompt(message('get_user_input'))
    user_input = gets.chomp.downcase

    if USER_VALID_CHOICES.include?(user_input)
      break
    else
      prompt(message('valid_choice'))
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

def result(player, computer)
  if WINNING_CONDITIONS[player].include?(computer)
    message('you_won')
  elsif WINNING_CONDITIONS[computer].include?(player)
    message('computer_won')
  else
    message('tie')
  end
end

prompt(message('welcome'))
prompt(message('game_rules'))

loop do # main loop
  prompt(message('start_game'))

  user_score = 0
  computer_score = 0

  while user_score < 5 && computer_score < 5 # game loop
    simplified_input = receive_user_input
    choice = convert_user_input(simplified_input)
    computer_choice = VALID_CHOICES.sample
    display_result = result(choice, computer_choice)

    prompt("#{message('you_chose')} #{choice};
    #{message('computer_chose')} #{computer_choice}")
    prompt(display_result.to_s)

    if display_result == "You won!"
      user_score += 1
    elsif display_result == "Computer won!"
      computer_score += 1
    end

    prompt("#{message('your_current_score')} #{user_score};
    #{message('computer_current_score')} #{computer_score}")
  end # game loop end

  if user_score > computer_score
    prompt(message('you_grand_winner'))
  elsif computer_score > user_score
    prompt(message('computer_grand_winner'))
  end

  prompt(message('continue'))
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end # main loop end

prompt(message('goodbye'))
