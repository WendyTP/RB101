=begin
Request: Given the following data structure, and without using the Array#to_h method, 
write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

expected result: 
{:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

  
=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hash = arr.each_with_object({}) do |sub_array, hash|
  hash[sub_array[0]] = sub_array[1]
end

p new_hash
p arr
