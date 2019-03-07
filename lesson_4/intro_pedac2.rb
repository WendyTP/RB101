# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
1. Understand problem:
input: string
output: array
rules:
explicit:
  - palindrome words are case sentive (ex. Mom is not; mom is)
  - return only substrings which are palidrome
  - return empty array if no match found
  - return empty array if no input given

implicit:
  - assume input are valid string or no input
Data: array
Guided Algorithm:
# Substrings method:
=====================
  - create an empty array called `result` that will contain all the required substrings
  - initialize variable start_substring_idx and assign 0 to it.
  - initialize variable end_substring_idx and assign value of start_substring_idx + 1 to it.
  - Enter loop which will break when start_substring_idx is equal to str.size - 1
  - Within that loop enter another loop that will break if
     - end_substring_idx is equal to str.size
     - append to the result array part of the string from start_substring_idx to end_substring_idx
     - increment `end_substring_idx` by 1.
     - end the inner loop
  - increment `start_substring_idx` by 1.
  - reassign `end_substring_idx` to `start_substring_idx += 1`
  - end outer loop
  - return `result` array

# is_palindrome? method:
=======================
  - check if a given substring value is equal to it's reverse value
     (String#reverse)

# palindrome_substrings method:
===============================
 initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#    - if the word is a palindrome, append it to the result array
#  - return the result array
=end

def substrings (string)
  result = []
  start_substring_index = 0
  finish_substring_index = start_substring_index  + 1
  while start_substring_index < string.size
    loop do
      break if finish_substring_index == string.size
      result << string[start_substring_index..finish_substring_index]
      finish_substring_index += 1
    end
    start_substring_index += 1
    finish_substring_index = start_substring_index + 1
  end
  result
end

def is_palindrome?(substring)
  substring == substring.reverse
end

def palindrome_substrings(string)
  final_result = []
  substring_array = substrings(string)
  substring_array.each do |word|
    final_result << word if is_palindrome?(word)
  end
  final_result
end

p palindrome_substrings("supercalifragilisticexpialidocious")
p palindrome_substrings("abcddcbA")
p palindrome_substrings("palindrome")
p palindrome_substrings("")