=begin
input: a hash
output: an integer
rules:
  - add up the values from the given hash
data: hash
algorithm:
  - set an integer variale (total_age) for 0
  - iterate through the age hash:
    - add each value to total_age
puts total_age  => 32+30+...
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# using Enumerable#inject method
ages_values = ages.values
total_age = ages_values.inject {|sum,n| sum + n }


# 1st attempt
=begin
total_age = 0
ages.each_value do |age|
  total_age += age
end
=end

# 2nd attempt
=begin
total_age = 0
index = 0
age_keys = ages.keys
while index < age_keys.size
  current_key = age_keys[index]
  current_value = ages[current_key]
  total_age += current_value
  index += 1
end
=end

# 3rd attempt
=begin
total_age = 0
ages_values = ages.values
ages_values.each do |age|
  total_age += age
end  
=end

puts total_age