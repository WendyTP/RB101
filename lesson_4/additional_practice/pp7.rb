=begin
input: a string
output: a hash
rules:
  - create a hash with each key representing letter and value representing number of coourence
  - case sensitive
  - result: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
data: array for iterate through each chars of the string
algorithm:
  - set up hash keys:
    - split each characters of the string => statement_array
    - set an empty array variable (character_list) to store the hash keys
    - iterate through statement_array: insert the characters into character_list,
      if the character is not included yet.
  - set an empty hash variable (character_count) to stroe the hahs keys and values
  - iterate through character_list :
    - count number of occurence of character appeared in state_array
    - save this counted number as the hash value for character_count
=end

# using String#scan method
statement = "The Flintstones Rock"
result = {}
letters = ("a".."z").to_a + ("A".."Z").to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

# first attempt
=begin
statement = "The Flintstones Rock"
statement_array = statement.chars.keep_if {|char| char != " "}
character_list = []
statement_array.each do |char|
  character_list << char unless character_list.include?(char)
end

character_count ={}
character_list.each do |char|
  character_count[char] = statement_array.count(char)
end

p character_count
=end