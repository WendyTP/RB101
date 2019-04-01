=begin
Request: Given this data structure write some code 
to return an array containing the colors of the fruits and the sizes of the vegetables.
The sizes should be uppercase and the colors should be capitalized.
Expected result: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

selected_hash = hsh.map do |_,details|
  if details[:type] == 'fruit'
    details[:colors].map do |color|
      color.capitalize
    end
  elsif details[:type] == 'vegetable'
    details[:size].upcase
  end
end  

p selected_hash


