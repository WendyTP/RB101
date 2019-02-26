munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munster_copy = munsters 

def mess_with_demographics(demo_hash)
    new_hashes = demo_hash
    puts demo_hash.object_id
    puts new_hashes.object_id
    demo_hash.values.each do |family_member|
      puts "#{family_member["age"].object_id}" + "first"
      family_member["age"] += 42
      puts "#{family_member["age"].object_id}" + "second"
      family_member["gender"] = "other"
  end
    puts demo_hash.object_id
  
end

p mess_with_demographics(munster_copy)
p munsters
=begin
The data in munsters is changed following the above method invocation.
When a variable of an element in hash/ array is re-assigned, the variable refers to a new object, however,
the hash/ array itself still refers to the same object. (The only change is that it now contains different values.) 


=end