['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

=begin
The .each_with_object method passes the method argument object into block, 
and applies the block instruction onto each element in the enum. 
It then returns the collection object (updated).

The above example returns a hash: {"a" => "ant", "b" => "bear" , "c" => "cat"}
=end