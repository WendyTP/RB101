# practise writing pseudo code

# example 1: a method that returns the sum of two integers

# 1-1 casual pseudo:
# Ask user to give two numbers
# Perform an operation of adding up these two numbers
# output the result 
# 1-2 formal pseudo:
# START
# PRINT "welcome, please give first number:"
# SET number1 = GET input from user
# PRINT "Please give second number:"
# SET number2 = GET input from user
# SET result = number1 + number2
# PRINT result
# END 

# example 2: a method that takes an array of strings, and returns a string that is all those strings concatenated together

# 2-1 casual pseudo:
# ["i like sun"] => "ilikesun"
# given an array of strings
# set an empty string
# iterate through the array one by one,
# combine the first element to empty string
# combine the second on second iterationr, then the third and so on
# After iteration, return the updated string
# 2-2 formal pseudo:
# START
# PRINT "Plesae write a setense.:"
# SET setense_string = GET user input
# SET setense_array = split the string and transform into an array
# SET string = empty string
# SET iterator = 1
# WHILE iterator <= length of setense_array
  # string  = string + first array element
  # iterator = iterator +1
# print string
# END

# example 3:   a method that takes an array of integers, and returns a new array with every other element

# 3-1 casual pseudo:
# [1,2,3,4,5,6] => [1,3,5]
# given an array of integers
# set a new array that is empty
# iterate through the given array one by one,
# add the first element into the new array
# skip the second element 
# continue the iterationr and skip the 4th element
# continue the skipping pattern until iterating through the array
# print the new array

# 3-2 formal pseudo:
# START

# Given a collection of integers called "numbers"
# SET iterator  = 1
# SET new_array = empty array
# WHILE iterator <= length of numbers
  # new_array = new_array + current number (first number)
  # skip when current number is in odd-number positions
  # iterator  = iterator + 1
# PRINT new_array
# END   

=begin
not_indent = <<HEREDOC
This would contain certian text.
  this line is indented.
this may span many lines.
HEREDOC
=end

=begin
  indent = <<-IHEREDOC
This would contain Iheredoc.
  this line is indented.
it span many lines.  
  IHEREDOC
=end


expect_indent = <<~SQUIGGLY_HEREDOC
This would contain certain text.
  The three lines should be indented.
  This would span many lines.

  SQUIGGLY_HEREDOC

#puts(not_indent)



#puts(indent)

puts(expect_indent)

