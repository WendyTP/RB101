def joinor(arr,separator_sym = ", ", separator_word = "or")
  sentence = ""
  if arr.size == 1
    sentence << arr[0].to_s
  elsif arr.size == 2
    sentence << arr[0].to_s + " or " + arr[1].to_s
  else
    arr[0..-2].each do |num|
      sentence << num.to_s + separator_sym
    end
    sentence << separator_word + " " + arr[-1].to_s
  end
  sentence
end

p joinor([1, 2])                 
p joinor([1, 2, 3])               
p joinor([1, 2, 3], '; ')        
p joinor([1, 2, 3], ', ', 'and') 