
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

def valid_number?(number)
  (integer?(number)|| float?(number)) && (number.to_f > 0)
end  

def valid_number_apr?(number)
  (integer?(number) || float?(number)) && (number.to_f >= 0)
end


prompt(message('welcome'))

name = nil
loop do
  name = gets.chomp
  if valid_name?(name)
    break
  else
    prompt(message('valid_name'))
  end   
end


loop do # main loop

  user_loan_amount = nil
  loop do
  
  prompt(message('loan_amount'))
    user_loan_amount = gets.chomp
    if valid_number?(user_loan_amount) 
      break
    else
    
    prompt(message('valid_number')) 
    end  
  end

  user_apr = nil
  loop do  
  
  prompt(message('apr'))
    user_apr = gets.chomp
    if valid_number_apr?(user_apr)
      break
    else
      prompt(message('valid_number')) 
    end  
  end

  user_loan_year = nil
  loop do
  
  prompt(message('loan_year'))
    user_loan_year = gets.chomp
    if valid_number?(user_loan_year)
      break
    else
      prompt(message('valid_number'))  
    end  
  end

  loan_amount = user_loan_amount.to_f

  monthly_interest_percentage = (user_apr.to_f)/12

  monthly_interest = monthly_interest_percentage / 100

  loan_month = (user_loan_year.to_f)*12

  if monthly_interest == 0
      monthly_payment = loan_amount/ loan_month
  else
    monthly_payment = loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_month)))
  end


prompt "#{message('monthly_interest_message')} #{monthly_interest_percentage.round(2)}%"

prompt "#{message('loan_duration_message')} #{loan_month.round} #{message('loan_duration_trail')}"

prompt "#{message('monthly_payment_message')} #{monthly_payment.round(2)}"

prompt(message('continue_calculation'))
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end  # main loop end

prompt(message('goodbye'))

