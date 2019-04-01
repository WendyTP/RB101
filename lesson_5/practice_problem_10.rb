=begin
Request: Given the following data structure and without modifying the original array, 
use the map method to return a new array identical in structure to the original, 
but where the value of each integer is incremented by 1
=end

given_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_array= given_array.map do |inner_hash|
  inner_hash.each_with_object({}) do |(key,value),new_hash|
    new_hash[key]= value+1
  end
end

p new_array
p given_array