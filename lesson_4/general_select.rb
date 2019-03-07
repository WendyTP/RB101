=begin
# create a method choosing hash values that are either "Fruit" or "Vegetable", based on a given selection criteria
input: hash
output: hash
rules:
  - assume input is a valid hash, or empty hash
  - return a new hash, original input remains unchanged
  - use loop method 
data: using array for the hash keys, and iterate through the keys
algorithm:
  - set a variable (chosen_items) for an empty hash
  - set an array variable (produce_keys) storing the keys of input hash
  - iterate through the given_keys
    - current_value = given_leys[index]
    - insert key_value pair to chosen_items if current_value == selection criteria (2nd parameter)
  - returns chosen_items 
=end

def general_select(produce_list, selection_criteria)
  chosen_items = {}
  produce_keys = produce_list.keys # [key1, key2, ...]
  counter = 0
  loop do 
    break if counter == produce_keys.size
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    if current_value == selection_criteria
      chosen_items[current_key] = current_value
    end
    counter += 1
  end
  chosen_items
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select(produce, 'Fruit') 
p general_select(produce, 'Vegetable')
p general_select(produce, 'Meat') 