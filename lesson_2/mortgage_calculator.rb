
def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def valid_number?(number)
  (integer?(number)|| float?(number)) && (number.to_f > 0)
end  

def valid_number_apr?(number)
  (integer?(number) || float?(number)) && (number.to_f >= 0)
end
puts "Welcome! This is a mortgage calculator."

loop do # main loop

  user_loan_amount = nil
  loop do
    puts "Please provide your loan amount: "
    user_loan_amount = gets.chomp
    if valid_number?(user_loan_amount) 
      break
    else
      puts "This is not a valid number."  
    end  
  end

  user_apr = nil
  loop do  
    puts "What percentage is your Annual Percentage Rate? (no need to enter %)"
    user_apr = gets.chomp
    if valid_number_apr?(user_apr)
      break
    else
      puts "This is not a valid number."  
    end  
  end

  user_loan_year = nil
  loop do
    puts "How many years is this loan for? (no need to enter the word year)"
    user_loan_year = gets.chomp
    if valid_number?(user_loan_year)
      break
    else
      puts "This is not a valid number."  
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

  puts "Your monthly interst rate is #{monthly_interest_percentage.round(2)}%"
  puts "Your loan duration is #{loan_month.round} months."
  puts "Your monthly payment is #{monthly_payment.round(2)}."

  puts "Would you like to do another calculation? (type y to continue.) "
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end  # main loop end
puts "Thank you & goodbye!"

