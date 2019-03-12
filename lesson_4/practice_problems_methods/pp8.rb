arr = [1, 2, 3, 4, 5]
arr.take(2)

=begin
We can find out how the take method works from either Enumerable#take section or 
Array#take section in the Ruby Doc.

This method returns first n element from enum, and returns them in a new array.
The method is not destructive-- we can tell by either test it directly or look at the Ruby Doc, where it shows
the return value of this method is a new array.

The above code returns  [1,2]

=end