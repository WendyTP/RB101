=begin
Request: Given the following data structure use a combination of methods, 
including either the select or reject method, 
to return a new array identical in structure to the original but containing only the integers that are multiples of 3.


=end

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

multiple_of_three = arr.map do |sub_array|
  sub_array.select do |number|
    number % 3 == 0
  end
end

p multiple_of_three
p arr
