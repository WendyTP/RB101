=begin
Request: Given this nested hash, figure out the total age of just the male members of the family.
input: hash
output: total age --> integer
data: nested hash
algorithm:
  - set an varialble (total_age) = 0
  - iterate through the nested hash
  - if gender value is 'male'
      - total_age += age
  return total_age    
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
munsters.each do |_,inner_hash|
  if inner_hash['gender'] == 'male'
    total_age += inner_hash['age']
  end
end

p total_age

# another way using each_value method:
=begin
total_age = 0
munsters.each_value do |details|
  total_age += details['age'] if details['gender'] == 'male'
end

p total_age
=end