=begin
# create a method that transform an element by multiplying it to 2, if the element has odd index
input: array
output: array
rules:
  - assume input is valid array or empty array
  - only modify element whose position index is odd number  (0 is an even number)
  - return the transformed result, but original input is not mutated
data: array
algorithm:
  - set a variable (result) for an empty array
  - iterate through the given array
    - current value = given array[index]
    - if index is odd number, multiply the current value by 2, then insert it to result
    - otherwise, just insert the current value to result directly
  returns result  
=end

def double_odd_index(numbers)
  result = []
  counter = 0
  loop do
    break if counter == numbers.size
    current_value = numbers[counter]
    current_value *= 2 if counter.odd?
    result << current_value
    counter += 1
  end
  result
end

my_nums = [1,2,3,4,5]
p double_odd_index(my_nums)
p my_nums