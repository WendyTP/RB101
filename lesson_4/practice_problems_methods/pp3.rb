[1, 2, 3].reject do |num|
  puts num
end

=begin
Form the Enumerable#reject section of Ruby documentation, we can conclude that the return value of
this reject method is [1,2,3]
The reject method returns an array containing elements , of which has been evaluated to false following the block
iteration.
The return value of each block iteration is nil (puts method always return nil). Since nil is not a truthy value, each element 
in the collection is than returned.
=end