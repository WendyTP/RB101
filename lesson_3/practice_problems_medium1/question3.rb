def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0 
    divisor -= 1
  end
  factors
end

p factors(4)
#factors(0)
#factors(-1)

=begin
Bonus1: 
The purpose of the `number % divisor == 0` is a condition set to determin which number to 
include into the factors array. 
Bonus2:
the `factors` before the end of method is to have the result of factors returned,
following method invocation
=end