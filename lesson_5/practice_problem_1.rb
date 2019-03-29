=begin
Request: How would you order this array of number strings by descending numeric value?  
rules: practicing sorting, nested data collection and working with blocks  
expected result : ['11','10','9','8','7']
=end

arr = ['10', '11', '9', '7', '8']
new_arr = arr.sort do |a,b|
  b.to_i <=> a.to_i
end
p new_arr