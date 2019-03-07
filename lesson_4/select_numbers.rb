=begin
# Create a method that selects the specified letters from a given string
input: a string; a string of one letter
output: a string 
rule:
  - assume input are valid strings (no empty input or any other object types other than string)
  - return an entirely different string
  - case not sensitve
Data: Array for selection process
Algorithm:
  - set an array variable (string_array) containing the characters of given string
  - set a string varialbe (result) for an empty string
  - iterate through each element in the string_array,
    - insert any character matches to the specified letter (both cases) into result variable.
  return result    
=end

def select_letter(string, specified_letter)
  string_array = string.split("")
  result = ""
  counter = 0
  loop do
    if string_array[counter].downcase == specified_letter
      result << string_array[counter]
    end
    counter += 1
    break if counter == string_array.size
  end
result
end
     
alphabet = 'abcdefghijklmnopqrstuvwxyz'

p select_letter(alphabet, 'a')
p select_letter("Goog goat Golf", 'o')