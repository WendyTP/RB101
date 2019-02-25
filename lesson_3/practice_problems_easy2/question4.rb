advice = "Few things in life are as important as house training your pet Dinosaur."
p advice.include?("Dino")
p advice.match?("Dino")

# Both methods are not the perfect solution,
# as they would match any substrings with "Dino" in it.

# another way of checking:
advice.split.each do |word|
  puts "#{word}" if word == "Dino"  
end  