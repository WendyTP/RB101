=begin
# Append an "s" to each string element in a given array
input: an array
output: an array
rules:
  - assume input is a valid array and contains only string elements
  - returns a new array 
  - original given array remains intact
algorithm:
  - set a variable (transform_array) for an empty array
  - iterate through the given array
    - set a new variable containing each element of given array with the added "s"
    - insert each new variable to transform_array
  - return the transofrm_array  
=end

def append_s(array)
  transform_array = []
  counter = 0
  loop do
    transform_array << array[counter] + "s"
    counter += 1
    break if counter == array.size
  end
  puts transform_array[0].object_id
  transform_array
end

fruits = %w(apple banana pear)
vegs = %w(onion garlic salad)

p append_s(fruits)
p fruits
p fruits[0].object_id
#p append_s(vegs)
#p vegs