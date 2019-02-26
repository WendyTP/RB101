def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

=begin
<< method mutates the caller with the modification at place. 
+ method perform the addition, returning the updated result, however,
the original caller remains unchanged. Therefore, we would need to
re-assign the variable to the updated result.

Better response:
The above two methods return the same value, however, in the first implementation,
the input argument (buffer) will be modified at place and changed following method invocation.
The inpyt argument (input_array) in the second implementation, on the other hand, will not be altered
following the method invocation.
=end