=begin
# from a given hash, select the one with value "Fruit"
input: a hash
output: a hash
rules:
  - assume input is valid and is a hash
  - "Fruit" is case sensitive
  - returns a new hash with selected items
data: hash
algorithm:
  - set an empty hash (selected_hash)
  - iterate through the given hash
    - if a key_value pair's value is "Fruit"
      - add this key_value pair to selected_hash
  - return the selected_hash
=end

# using .each method to iterate
def select_fruit(hash)
  selected_hash = {}
  hash.each do |key, value|
    if value == "Fruit"
      selected_hash[key] = hash[key]
    end
  end
  selected_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}
p select_fruit(produce)

# using loop to iterate
def choose_fruit(input_hash)
  given_keys = input_hash.keys  # [key1, key2, ...]
  result_hash = {}
  counter = 0
  loop do
    break if counter == given_keys.size
    current_key = given_keys[counter]
    current_value = input_hash[current_key]
      if current_value == "Fruit"
      result_hash[current_key] = current_value
    end
    counter += 1
  end
  result_hash
end

grocery = {
  'pomme' => 'Fruit',
  'carotte' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p choose_fruit(grocery)
