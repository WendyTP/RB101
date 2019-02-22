famous_words = "seven years ago..."

famous_words = "Four score and " + famous_words

puts famous_words.split.unshift("Four").join(" ")

puts famous_words

famous_words = "Seven years ago..."

famous_words.prepend("Four score and ")
puts famous_words