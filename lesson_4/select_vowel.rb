=begin
# create a method to select all vowels from a given string
input: string
output: string
rule: 
  - assume input is valid, and only as string
  - return a new string containing all the vowels of the given string
  - given string remains unchanged
  - case is not sensitve
data: array
  algorithm:
  - set an empty string variable (selected_vowels)
  - set an array containing the elements of the given string
  - iterate through the array
    - if an element matches to a string of vowels, 
      - insert the element to selected_vowels string
  - return selected_vowels
=end

def select_vowel(string)
  selected_vowels = ""
  string_array = string.split("")
  counter = 0
  loop do
    if "aeiou".include?(string_array[counter].downcase)
      selected_vowels << string_array[counter]
    end
    counter += 1
    break if counter == string_array.size
  end
  selected_vowels
end

p select_vowel("Apple pie")
p select_vowel("vegetable")