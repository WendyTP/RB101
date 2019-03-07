=begin
# create a method that modify an element by 2 only if the element is odd number
input: an array 
output: an array
rule:
  - assume input is a valid array containing integers, or an empty array
  - returns an array with the modified result, but the input remains unchanged
data: array
algorithm:
  - set a varialbe (result) for an empty array
  - iterate through the given array
    - if an element is odd number, multiply it by two and insert to result
    - otherwise, just insert the element directly to result
  returns result  
=end

def double_odd_numbers(numbers)
  result = []
  counter = 0
  loop do
    break if counter == numbers.size
    current_value = numbers[counter]
    if current_value.odd?
      current_value *= 2
    end
    result << current_value
    counter += 1
  end
  result
end

my_numbers = [1,3,4,6,7]
p double_odd_numbers(my_numbers)
p my_numbers

