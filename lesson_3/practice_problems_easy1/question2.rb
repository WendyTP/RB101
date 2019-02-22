=begin

The difference between ! and ? in Ruby:
Correct answer: If the ! or ? is at the end of a method, it's part of a Ruby method name, 
                not a Ruby syntax. Therefore we wouldn't know what that method is doing,
                even if it ends in these 2 characters. It all depends on the method implementation. 


1. what is != and where should you use it?
  Ans: It means "not equal to". We use it when we want to compare two objects which do 
       not have the same value.

2. put ! before something, like !user_name
  Ans: ! before a truthy value will return false; ! before a non-truthy value (ie. nil or false)
       will retruns true.
  
  Correct ans: !<some object> is used to turn any object into the opposite of their boolean equivalent.

3. put ! after something, like words.uniq!
  Ans: Putting ! after certain methods will turn the method destructive, and therefore mutates the caller.

4. put ? before something
  Ans: This is a character literal notation, for representing
       single character strings.
       ex. ?a  => "a"
       ex. ?abc => SyntaxError
       ex. ?\n => "\n"
  
  Other ans: ? is the ternary operator for if...else

5. put ? after something
   Ans: Putting ? after method indicates that the method will return either true or false

   Other ans: ? is the ternary operator for if...else

6. put !! before something, like !!user_name
  Ans: !! before a truthy value will return true; !! before a non-truthy value (ie. nil or false)
       will retruns false.

  Correct ans: !!<some object> is used to turn any object into their boolean equivalent.
=end