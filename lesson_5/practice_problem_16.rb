=begin
Write a method that returns one UUID when called with no parameters.
=end

def generate_UUID
  characters =[]

  (0..9).each do |num|
    characters << num.to_s
  end

  ('a'..'z').each do |char|
    characters << char
  end

  uuid = ""

  sections =[8,4,4,4,12]

  sections.each_with_index do |section,index|
    section.times {uuid += characters.sample}
      uuid += "-" if index < sections.size - 1
  end

  uuid
end

p generate_UUID