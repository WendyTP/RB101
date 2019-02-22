numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
p numbers  # extra for testing
puts numbers.inspect  # extra for testing

=begin
The above code should print out: 
1,2,2,3 (on separated lines).
Even though the .uniq method gets rid of the duplicated numbers, and returns a 
an updated array, this method does not mutate the caller (ie. numbers). 
Therefore, the variable numbers still refers to the original array.
To mutates the caller in this case, it would be the .uniq! method that is needed.
=end
