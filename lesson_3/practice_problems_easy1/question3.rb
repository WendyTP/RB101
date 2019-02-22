advice = "Few things in life are as important as house training your pet dinosaur."

another_advice = advice.gsub(/important/, "super urgent")

advice.gsub!("important", "urgent")

p another_advice
p advice

