numbers = [6,7,8,9]
numbers.each_with_index do |number,index|
  p "#{index} #{numbers.inspect} #{number}"
  numbers.shift(1)
  p numbers
end

=begin
The output of "p numbers" would be 6,8; 
and the return value would be [6,8].

With the .shift method, the array is being changed as we go; 
and the loop counter used by #each is compared against the current length of the array, 
rather than it's original length. 
(* The each counter still go through each index from 0 to last by each iteration.)
=end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
=end
=begin
The output of the above code would be:
1
2

# To note:
In both cases we see that iterators DO NOT work on a copy of the 
original array or from stale meta-data (length) about the array. 
They operate on the original array in real time (ie. on the changed array).



=end
