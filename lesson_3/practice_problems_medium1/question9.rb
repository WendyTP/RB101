def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# rps("rock", "paper") => "paper"
# rps("rock", "scissors") => "rock"
# rps("paper", "rock") => "paper"
# rps("paper", "rock") => "paper"
# final result => "paper"