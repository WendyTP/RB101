Example 9

```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
```



| Line | Action                    | Object                                          | Side Effect | Return Value                                                 | Is Return Value Used?                                  |
| ---- | ------------------------- | ----------------------------------------------- | ----------- | ------------------------------------------------------------ | ------------------------------------------------------ |
| 1    | method call (`map`)       | the outer array (contains 2 middle arrays)      | no          | new 2-element array - [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]] | no                                                     |
| 1-7  | outer block execution     | each middile array (each contains inner arrays) | no          | [[1], [2], [3], [4]],['a'], ['b'], ['c']]                    | yes, used by `map` for transformation                  |
| 2    | method call (`each`)      | each middle array                               | no          | the calling object (each middle array)                       | yes, it determins the return value of the outer block  |
| 2-6  | middle block execution    | each inner array                                | no          | [[1], [2], [3], [4],['a'], ['b'], ['c']],[]]                 | no                                                     |
| 3    | method call (`partition`) | each inner array                                | no          | a nested array with 2 inner array (`[[1], [2], [3], [4],['a'], ['b'], ['c']],[]]`) | yes, it determins the return value of the middle block |
| 3-5  | inner block execution     | each element                                    | no          | `true` for all items                                         | yes, used by `partition` for ordering items            |
| 4    | `element3.size > 0`       | n/a                                             | no          | boolean                                                      | yes, it determins the return value of the inner block  |

*  the first method call within `map` is `each`. If we understand `each`, we know that it doesn't care about the block's return value and it always returns the calling object. Therefore, just by looking at line 2, we can already say that the return value of `map` will be a new array that matches the value of the calling object. 



Example 10

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
=> [[[2, 3], [4, 5]], [6, 7]]

```

#### Mutating collections while Iterating

***Do not mutate the collection that we're iterating through.*** 

 Since iteration is the basis of selection and transformation, that implies don't mutate the collection **while** we're performing selection or transformation or pretty much any action on the collection.

Below is an example of how expected result is impacted by mutation:

``` ruby
# The method remove_evens! should delete all even numbers from the array passed in as the argument.

def remove_evens!(arr)
  arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])
# expected return value [1, 1, 3, 9]
# actual return value [1, 1, 3, 6, 9]
```

The `Array#delete` method is destructive, and is changing the contents of `arr `during iteration. When an item is deleted, the preceding item shifts its place and moves one index forward. This means the iteration jumps over this preceding item, and continues iterating on the item after that. Hence the unexpected result.



One way you could fix the code above is to create a shallow copy of the array and iterate through it while mutating the original array. (Providing we are requested to mutate the original collection.)

```ruby
def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end
```

