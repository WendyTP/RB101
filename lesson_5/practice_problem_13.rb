=begin
Request: Given the following data structure, 
return a new array containing the same sub-arrays as the original
but ordered logically by only taking into consideration the odd numbers they contain.
Expected result:   [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
=end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

ordered_arr = arr.sort_by {|sub_array| sub_array[2]}

p ordered_arr
p arr

# another way

another_ordered_arr = arr.sort_by do |sub_array|
  sub_array.select do |num|
    num.odd?
  end
end

p another_ordered_arr