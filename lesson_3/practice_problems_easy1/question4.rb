numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
=begin
The above method will delete the element with index #1 in this array.
In this example. it will delete 2 from numbers, and returnthe deleted value (2).
This method is destructive, so following this method, numbers will have value of [1,3,4,5]
=end

p numbers
numbers =[1,2,3,4,5]

numbers.delete(1)
=begin
The above method will delete the element whose value is 1 in this array.
It will return the deleted value (1).
This method is destructive, so following this method, numbers will have value of [2,3,4,5]
=end

p numbers