=begin
# create a method that transform all elements in a given array by multiplying them to a given multipli
input: an array (containing numbers); an integer
output: an array
rule:
  - assume input is valid array or empty array ; the integer input is also valid
  - return the transformed result, but the original input remains unchanged
Data: array
Algorithm:
  - set up a varialbe (result) for an empty array
  - iterate through the given array
    - multipy each elment by the given multipli and insert to the result variable
  - return result  
=end

def multiply(numbers, multiply_times)
  result = []
  counter = 0
  loop do
    break if counter == numbers.size
    result << numbers[counter] * multiply_times
    counter += 1
  end
  result
end

my_numbers = [1,4,3,7,6]
p multiply(my_numbers, 3)
p my_numbers