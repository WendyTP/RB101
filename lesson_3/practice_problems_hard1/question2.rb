greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

=begin
The last line of the above code should be {a: 'hi there'}
The informal_greeting is set to point to the first value of greetings hash, which is a string object.
With the << method, Ruby adds the word 'there' directly to the string 'hi', without creating another copy.
Since informal_greeting still points to the same string object and we altered the value of this string object 
through informal_greeting; therefore, the value of the first key in greetings is changed.
=end

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting += ' there'

puts informal_greeting  #  => "hi there"
puts greetings

=begin
The last line of the above code should now be {a: 'hi'}
By changing the method from  << to += operator, instead of altering the same string object,
Ruby creates a copy of 'hi', add the ' there' to it, and then re-assign this new string object reference
to the variable informal_greeting.
Since informal_greeting is no longer pointed to the same string object as greetings[:a], the change made on 
informal_greeting would not impact greetings[:a], hence the hash greetings.
=end

informal = greetings[:a].clone
p informal.object_id
p greetings[:a].object_id

=begin
The above .clone method initialize the variable informal with a reference to a new object, containing the same
value of the clone receiver.
=end