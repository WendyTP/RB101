# puts "the value of 40 + 2 is " + (40 + 2)
=begin
The above will raise an error, because it was trying to concatenate an integer 
(40+ 2) into a string. 
=end

puts "the value of 40 + 2 is " + (40+20).to_s
puts "the value of 40 + 2 is #{40+20}"