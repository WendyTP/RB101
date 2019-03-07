=begin
# Create a method that selects all "g"s from a given string
input: a string
output: a string of "g"s
rule:
  - assume input are valid strings (no empty input or any other object types other than string)
  - return an entirely different string
  - both "G" and "g" need to be selected
Data: Array for selection process
Algorithm:
  - set an array variable (string_array) containing the characters of given string
  - set a string varialbe (result) for an empty string
  - iterate through each element in the string_array,
    - insert any character that is either "g" or "G" into result variable.
  return result    
=end

def select_gs(string)
  string_array = string.split("")
  result = ""
  counter = 0
  loop do
    if string_array[counter].downcase == "g"
      result << string_array[counter]
    end
    counter += 1
    break if counter == string_array.size
  end
result
end
     
alphabet = 'abcdefghijklmnopqrstuvwxyz'

p select_gs(alphabet)
p select_gs("Goog goat Golf")