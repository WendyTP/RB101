require 'yaml'
LANGUAGE = 'en'
MESSAGES = YAML.load_file('mortgage_calculator_message.yml')

def message(key)
  MESSAGES[LANGUAGE][key]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_name?(name)
  /\w/.match(name)
end

def integer?(number)
  /^\d+$/.match(number)
end

def float?(number)
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

def valid_loan_amount?(number)
  (integer?(number) || float?(number)) && (number.to_f > 0)
end

def valid_number_apr?(number)
  (integer?(number) || float?(number)) && (number.to_f >= 0)
end

def valid_loan_duration?(number)
  (integer?(number) && (number.to_i > 0))
end

prompt(message('welcome'))
name = nil
loop do
  name = gets.chomp
  break if valid_name?(name)
  prompt(message('valid_name'))
end

loop do # main loop
  user_loan_amount = nil
  loop do
    prompt(message('loan_amount'))
    user_loan_amount = gets.chomp
    break if valid_loan_amount?(user_loan_amount)
    prompt(message('valid_number'))
  end

  user_apr = nil
  loop do
    prompt(message('apr'))
    user_apr = gets.chomp
    break if valid_number_apr?(user_apr)
    prompt(message('valid_number'))
  end

  user_loan_month = nil
  loop do
    prompt(message('loan_month'))
    user_loan_month = gets.chomp
    break if valid_loan_duration?(user_loan_month)
    prompt(message('valid_number'))
  end

  loan_amount = user_loan_amount.to_f

  monthly_interest_percentage = user_apr.to_f / 12

  monthly_interest = monthly_interest_percentage / 100

  loan_month = user_loan_month.to_i

  if monthly_interest == 0
    monthly_payment = loan_amount / loan_month
  else
    monthly_payment = loan_amount * (monthly_interest /
                      (1 - (1 + monthly_interest)**-loan_month))
  end

  prompt"#{message('monthly_interest_message')}\
 #{monthly_interest_percentage.round(2)}%"

  prompt"#{message('loan_duration_message')} #{loan_month}\
 #{message('loan_duration_trail')}"

  prompt"#{message('monthly_payment_message')} #{monthly_payment.round(2)}"

  prompt(message('continue_calculation'))
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end # main loop end

prompt(message('goodbye'))
