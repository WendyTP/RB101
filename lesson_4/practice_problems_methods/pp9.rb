{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

=begin
The above code should return : [nil, "bear"]
The map method applies the block instrution to each elemnt, and returns all the values returned by the block.
(It does not take into account if the returned value from block is truthy or not)

** Detailed & completed explanation
1.map method always return an array, that's why the return value of the above code is an array.
2. An if statement will evaluates to true if the condition is met; 
when none of the conditions in an if statment evaluats to true, the if statement itself returns nil.
  

=end