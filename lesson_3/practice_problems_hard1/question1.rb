if false
  greeting = "hello word"
end

p greeting

=begin
Correct ans: 
The above code should return `nil`.
Typically when we want to reference an uninitialized variable, Ruby will raise an exception- 
"undefined method or local variable". However, if the local variable is initialized within an `if` block,
even if the `if` block does not get executed, the local variable will still be initialized to `nil`.

=end

if true 
  greet = "hello"
end

p greet

=begin
The above code will always return true, and therefore execute the assigment of "hello" reference to 
variable greet. In the end, it will print out "hello"

=end