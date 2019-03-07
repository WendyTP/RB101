# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

=begin
** My attempt of using PEDAC
input: string
output: string (another object)
rules:
explicit requirement: 
  - change the words that are palindromes uppercased 
  (palindrome: words that are the same read forward and backward)
  - palidromes are case sensitive ("Mom" is not palidrome, but "mom" is) ==> change to not case sensitive later
  - assume input are valid string
  - no input returns empty string
  - any words that are uppercased, remain uppercased regardless
Implicit requirement:
  - The returned string should be a new string  
Data Structure:
  - array 
Algorithm:
set a method
For the given string, split the string
set a variable (array) for storing the split string
set a another array varialbe with empty elements in it
Iterate through each string element in this array:
  - if the word == word.reverse
    uppercase this word
  - insert each word into the empty elements
set a new string variable, containing the joined elements from the updated array
return this new string variable
=end

def change_me (string)
  split_string = string.split
  new_array = []
  counter = 0
  if string == ""
    puts string
  else    
    loop do 
      if split_string[counter] == split_string[counter].reverse
        new_array << split_string[counter].upcase
      else
        new_array << split_string[counter]
      end
      counter += 1
      break if counter == split_string.length
    end
    palidrome_string = new_array.join(" ")
    puts palidrome_string
  end  
end

change_me("We will meet at noon")
change_me("")
change_me("There's no PALIDRONE")
change_me("I LOVE my mom and my dad equally")