=begin
Request: Using the each method, write some code to output all of the vowels from the strings.
input: hash
output: string

=end
vowels =%w(a e i o u)

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], 
  third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_,value|
  value.each do |word|
    word.chars.each do |letter|
      puts letter if vowels.include?(letter)
    end
  end
end
      
