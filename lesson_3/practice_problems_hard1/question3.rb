# A: 
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

=begin
The above should print out: "one is one ; two is two ; three is three"
Even though the parameters of the method have the same name as the outside variables, they are still separate and different variables,
In this method defintion, it simply assigns the method local variables with references of the objects outside varialbes point to.
=end

# B: 
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

=begin
The above should print out "one is one ; two is two ; three is three"
First the parameter variables point to the same reference as outside variables;
the parameter varialbes the re-assign with refenrences of new string objects. 
Since the parameter variables no longer point to the same objects as outside variables, 
the change to the parameter variables does not impact the outside variables.
=end

# C:
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

=begin
The above should print out "one is two ; two is three ; three is one"
The gsub! method mutates the caller at place. (instead of making a copy and applying change to it)
Since both parameter variables and outside variables point to the same objects, the change made onto the objects via 
access to parameter variables thus reflects on the outside variables.
=end