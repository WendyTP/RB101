# improvement 4: extract messages into a ymal file, except message containing string interpolation
# Remove the HEREDOC of operator_prompt, and replace with strings in ymal file.
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# puts MESSAGES.inspect
def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def valid_number(number)
  integer?(number) || float?(number)
end

def operation_to_message(op)
  message= case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
  message
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi, #{name}")

loop do # main loop

  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    if valid_number(number1)
      break
    else
      prompt(MESSAGES['warning'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if valid_number(number2)
      break
    else
      prompt(MESSAGES['warning'])
    end
  end


  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_choice'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
            number1.to_f() + number2.to_f()
           when '2'
            number1.to_f() - number2.to_f()
           when '3'
            number1.to_f() * number2.to_f()
           when '4' 
            while !(valid_number(number2) && (number2!= "0"))
              prompt(MESSAGES['divider_0_warning'])
              number2 = Kernel.gets().chomp()
            end 
            number1.to_f() / number2.to_f()
              
          end
          
          
             

  prompt("The result is #{result}")

  prompt(MESSAGES['play_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end # main loop finish

prompt(MESSAGES['goodbye'])
