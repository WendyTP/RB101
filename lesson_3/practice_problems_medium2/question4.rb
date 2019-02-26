def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin
Following method invocation, the my_string will print out as "pumpkinsrutabaga".
The reference to object "pumpkins" is passed into the method, and a local variable a_string_param points is assigned with this reference.
with << method, the "rutabaga" string is added directly onto the object "pumpkins", instead of creating a new copy. 
Since there's no new object created, and both local variable a_string_param and outside variable my_string still reference to the same object.
therefore, my_string prints out the updated object.

Meanwhile, the my_array will print out ["pumpkins"]. The reference to the array object is passed into the argument, and was pointed to by 
new local variable an_array_param originally. During method definition, however, the an_array_param is reassigned to the reference of the a new array ["pumpkins", "rutabaga"].
Since it no longer points to the same object as my_array, the my_array prints out the original unchanged object.

=end