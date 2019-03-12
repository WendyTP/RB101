[1, 2, 3].select do |num|
  num > 5
  'hi'
end


=begin
The return value of the above select method should be : [1,2,3]
The last expression being evaluated by the block is the string 'hi', therefore,
it is the return value of the block at each iteration. Since a string is a truthy value, the select method select 
all the elements from the original collection.
=end
