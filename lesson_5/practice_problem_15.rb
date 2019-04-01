=begin
Request: Given this data structure write some code 
to return an array which contains only the hashes where all the integers are even.

Expecte result: [{e: [8], f: [6, 10]}]
=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

selected_arr = arr.select do |sub_hash|
  sub_hash.all? do |_,value|
    value.all? do |n|
    n.even?
    end
  end
end



p selected_arr
