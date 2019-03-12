hash = { a: 'ant', b: 'bear' }
hash.shift

=begin
From the Hash#shift section in Ruby documentation, we can find out how the shift method works on hashes.
The shift method in the above code should remove the first key-value pair of this hash, and returns this 
removed key-value pair in the form of two-item array [key,value].
The above code should return: [:a, 'ant']

=end