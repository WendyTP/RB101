=begin
Request: Given this family hash, print out the name, age and gender of each family member:
    (Name) is a (age)-year-old (male or female).
input: hash
output: 5 strings 
data: hash
algorithm:
  - iterate through each key/value pair 
  - insert the value to string statement and print it out
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |member,details|
  puts "#{member} is a #{details['age']}-year-old #{details['gender']}"
end

