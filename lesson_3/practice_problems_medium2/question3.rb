def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin
Following the method invocation, my_string will print out as "pumpkins".
At the begining the a_string_param variable references the  object "pumpkins". When the "rutabaga"
is concatenated with "pumpkins", it creates anther object, and therefore the a_string_param is re-assigned to this new object.
The object "pumpkins " outside of the method is untouched.

Meanwhile, the my_array will print out as ["pumpkins", "rutabaga"]. 
At first, the object reference of ["pumpkins"] is passed into the argument. When "rutabaga " is pushed into the array, instead of creating
another copy of array and make the change, the action is applied directly to the original array.


=end
