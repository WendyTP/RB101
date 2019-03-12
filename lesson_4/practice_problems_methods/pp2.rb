['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

=begin
By checking Enumerable#count from Ruby documentation, we know that the count method 
takes into account of all truthy values returned from the block iteration.

The above example returns an integer of 2.

=end