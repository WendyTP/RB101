=begin
To wrtie own version of the rails titleize method
(capitalize each word in a string)
input: a string
output: a string
rules:
  - to capitalize each word in a string
data: array
algorithm:
  - split each word and save to an array 
  - iterate through the array and capitalize each word
  - change the array back to a string
=end


# more concise version
def own_version_titleize(string)
  string.split.map {|word| word.capitalize}.join(" ")
end
  
# first attempt
=begin
def own_version_titleize(string)
  splitted_string = string.split
  splitted_string.each do |word|
    word.capitalize!
  end
  result = splitted_string.join(" ")
end
=end

puts own_version_titleize("the flington family")