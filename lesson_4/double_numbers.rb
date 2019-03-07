=begin
# create a method that transform all elements in a given array by multiplying by 2
input: an array (containing numbers)
output: an array
rule:
  - assume input is valid array or empty array
  - return the transformed result, but the original input remains unchanged
Data: array
Algorithm:
  - set up a varialbe (result) for an empty array
  - iterate through the given array
    - multipy each elment by 2 and insert to the result variable
  - return result  
=end

def double_numbers(numbers)
  result = []
  counter = 0
  loop do
    break if counter == numbers.size
    result << numbers[counter] * 2
    counter += 1
  end
  result
end

my_numbers = [1,4,3,7,6]
p double_numbers(my_numbers)
p my_numbers


# create a method that mutates the input
def doubling!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size
    numbers[counter] = numbers[counter] * 2   # or numbers[counter] *= 2
    counter += 1
  end
  numbers
end

my_num = [1,2,3,4]
p doubling!(my_num)
p my_num
