ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present: 
puts ages.has_key?("Spot")
puts ages.include?("Spot")
puts ages.fetch("Spot", "not found")
puts ages.select {|k,v| k == "Spot"}
puts ages.member?("Spot")