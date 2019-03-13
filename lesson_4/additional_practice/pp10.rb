=begin
input: a hash
output: a hash
rules: 
  - modify the original hash
  - add anther key-valu pair to each members
  - kid: age 0-17 ; adult: age 18-64 ; senior: age 65+
data: array and hash
algorithm:
  - transform the hash into an array and save into a variable
  - iterate through the array with index
    - set a case : case = value of age key
    if age 0-17 -> add key: age_group and assign value kid
    if 18-64 -> adult
    if 65+ -> senior
  - transform the array back to a hash    
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# simpler way
munsters.each do |name, details|
  case details["age"]
  when (0..17) then details["age_group"] = "kid"
  when (18..64) then details["age_group"] = "adult"
  when (65..) then details["age_group"] = "senior"
  end
end

puts munsters

# first attempt
=begin
munsters_array = munsters.to_a

munsters_array.each do |munster|
  age = munster[1]["age"]
  case age
  when (0..17) then munster[1]["age_group"] = "kid"
  when (18..64) then munster[1]["age_group"] = "adult"
  when (65..) then munster[1]["age_group"] = "senior"
  end
end

updated_munsters = munsters_array.to_h

p updated_munsters
=end

