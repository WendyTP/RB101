=begin
input: an array
output: an array or an integer
rules:
  - find the index of the first name starting with "Be"
=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# use Array#index {block}
# This method only find the first matching result
puts flintstones.index {|name| name[0,2]=="Be"}


# 2nd attempt
=begin
flintstones.each do |name|
  if name.start_with?("Be")
    puts flintstones.index(name)
  end
end
=end

# 1st attempt
=begin
chosen_names =flintstones.select do |name|
  name.start_with?("Be")
end

index = 0
while index < chosen_names.size
  current_value = chosen_names[index]
  puts flintstones.index(current_value)
  index += 1
end  
=end