[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=begin
The above code should return :[1, nil,nil]
Each item in the array is passed into the block for evaluation:
2 and 3 are bigger than 1, the if statment is then performed.
since puts always return nil, the block returns nil for the last iteration.
map method returns all values returned by the block, thus [1,nil.nil] 
=end