=begin
input: hash
output: integer (age)
rules:
  - pick out the minimum age from age hash
data: array
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# using Array#min
p ages.values.min

#2nd attempt
=begin
sorted_ages = ages.sort_by do |key,value|
  value
end

p sorted_ages.first
=end

# 1st attempt
=begin
age_values = ages.values
index = 0
youngest_age = age_values[index]
while index != age_values.size-1
  index+= 1
  if youngest_age > age_values[index]
    youngest_age = age_values[index]
  end
end

puts youngest_age
=end