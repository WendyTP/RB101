=begin
input: an array 
output: the same array but modified
rules:
  - modify the same array
  - each name to be shortened to 3 characters
data: array
algorithm:
  - iterate through the array
    - for each name,select the first 3 characters 
    - 
=end

# simpler way
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|name| name[0..2]}

p flintstones


# first attempt
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
shortened_names =[]
flintstones.each do |name|
  shortened_names << name.slice(0..2)
end

p shortened_names