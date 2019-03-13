=begin
input: hash
output: a hash
rules: 
  - returns people whose age is 100 or over
data: hash
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# 3rd attempt- using each_with_object
old_people = ages.each_with_object({}) do |(key,value),hash|
  if value >= 100
    hash[key] = value
  end
end  

# 2nd attempt
=begin
old_people ={}
ages_keys = ages.keys
index = 0
while index < ages_keys.size
  current_key = ages_keys[index]
  current_value = ages[current_key]
  if current_value >= 100
    old_people[current_key] = current_value
  end
  index += 1
end
=end

# 1st attempt
=begin
old_people = ages.select do |key,value|
  value >= 100
  end
=end  
puts old_people
