phrase = "The Flinstones Rock!"
#10.times {puts "#{phrase.prepend(" ")}"}
10.times {|n| puts " "* n + "The Flinstones Rock!"}