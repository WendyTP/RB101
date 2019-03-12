[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin
For the above code, the return value of the block should be a boolean of either true or false.
A block returns the last expression that's been evaluated, which is simiar to how a method returns a value.
Since the last expression within this block is .odd? method, the block returns either true or false at each iteration.

The any? method returns a boolean of either true or false, based on the returned value of the block.
If the block returns at least one truthy value, the any? method will returns true; otherwise, false.
In this code, the any? method returns true.

The output of this code is : 
1


# Reason why output code is only 1:
any? stops iterating after the block returns it's first truthy value,
since there is no need to evaluate the remaining items in the array;
therefore, puts num is only ever invoked for the first item in the array : 1.

=end