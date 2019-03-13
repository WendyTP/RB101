=begin
input: an array
output: a hash
rules:
  - the original input stays intact
  - hash key : name ; hash value : index in array
data: array 
algorithm:
  - set a hash variable (flintstones_family) for an emtpy hash
  - set a variable (index) for intial value of 0
  - iterate through flintstones array:
    - assign hash value to each hash key 
result: {"Fred" => 0, "Barney" => 1}
=end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# 3rd attempt - using simple loop
flintstones_family ={}
index = 0

while index < flintstones.size
  key = flintstones[index]
  flintstones_family[key] = index
  index += 1
end


# second attempt
=begin
flintstones_family ={}
flintstones.each_with_index do |item, index|
  flintstones_family[item]= index
end
=end


# first attempt
=begin
flintstones_family ={}
index = 0
flintstones.each do |item|
  flintstones_family[item] = index
  index += 1
end
=end

p flintstones_family