# improvement : Better integer validation
# Additional : handling divison with 0, and moved 4th scenario outside of case statement
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number(number)
  number.to_i.to_s == number
end

def operation_to_message(op)
  case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

prompt("Welcome! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi, #{name}")

loop do # main loop

  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number(number1)
      break
    else
      prompt("This doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    if valid_number(number2)
      break
    else
      prompt("This doesn't look like a valid number")
    end
  end

  
  operator_prompt = <<-question
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide

  question

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1,2,3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
            number1.to_i() + number2.to_i()
           when '2'
            number1.to_i() - number2.to_i()
           when '3'
            number1.to_i() * number2.to_i()
           end
  if operator == "4" 
    result = ""          
      loop do 
        if valid_number(number2) && (number2 != "0")
          result = number1.to_f() / number2.to_f()
          break
        else
          prompt("Sorry, divider can not be 0. Please give another number: ")
            number2 = Kernel.gets().chomp()
        end    
      end
  end        

  prompt("The result is #{result}")

  prompt("Do you want to perfom another calculation? (Type y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end # main loop finish

prompt("Thank you & Good bye!")
