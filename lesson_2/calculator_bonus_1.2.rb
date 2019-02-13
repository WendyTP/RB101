# improvement 5: Adding different langauge selection and move the string interpolation message to ymal file

require 'yaml'

LANGUAGE = 'fr'
MESSAGES = YAML.load_file('calculator_messages.yml')

def message(key)
  MESSAGES[LANGUAGE][key]
end

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
  input_choice= case op
  when '1'
    message('adding')
  when '2'
    message('subtracting')
  when '3'
    message('multiplying')
  when '4'
    message('dividing')
  end
  input_choice
end

prompt(message('welcome'))

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(message('valid_name'))
  else
    break
  end
end

prompt("#{message('hi')} #{name}")

loop do # main loop

  number1 = ''
  loop do
    prompt(message('first_number'))
    number1 = Kernel.gets().chomp()

    if valid_number(number1)
      break
    else
      prompt(message('warning'))
    end
  end

  number2 = ''
  loop do
    prompt(message('second_number'))
    number2 = Kernel.gets().chomp()
    if valid_number(number2)
      break
    else
      prompt(message('warning'))
    end
  end


  prompt(message('operator_prompt'))

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(message('valid_choice'))
    end
  end

  prompt("#{operation_to_message(operator)} #{message('operation_to_message_following')}")

  result = case operator
           when '1'
            number1.to_f() + number2.to_f()
           when '2'
            number1.to_f() - number2.to_f()
           when '3'
            number1.to_f() * number2.to_f()
           when '4' 
            while !(valid_number(number2) && (number2!= "0"))
              prompt(message('divider_0_warning'))
              number2 = Kernel.gets().chomp()
            end 
            number1.to_f() / number2.to_f()
              
          end
          
          
             

  prompt("#{message('result')} #{result}")

  prompt(message('play_again'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end # main loop finish

prompt(message('goodbye'))
