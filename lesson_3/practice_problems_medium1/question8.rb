munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


def mess_with_demographics(demo_hash)
    demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
    end
  
    
end

p mess_with_demographics(munsters)
p munsters
=begin
The data in munsters is changed following the above method invocation.
When a variable of an element in hash/ array is re-assigned, the variable refers to a new object, however,
the hash/ array itself still refers to the same object. (The only change is that it now contains different values.) 


=end