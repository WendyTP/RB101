def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid("blue")
p color_valid("green")
p color_valid("red")

=begin
This is a simplified version of below method. Since Ruby automatically evaluate statements,
there's no need to specify "evaluating to true or false".

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end




end