Example 4

``` ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```



| Line | Action                         | Object                                      | Side Effect                                  | Return Value                                        | Is Return Value Used?                                  |
| ---- | ------------------------------ | ------------------------------------------- | -------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------ |
| 1    | variable assignment (`my_arr`) | n/a                                         | None                                         | `[[18,7],[3,12]]`                                   | No                                                     |
| 1    | method call (`each`)           | The outer array (`[[18,7],[3,12]]`)         | None                                         | The calling object (`[[18,7], [3,12]]`)             | Yes,  assigned to variable (`my_arr`)                  |
| 1-7  | outer block execution          | Each sub-array (`[18,7]`, `[3,12]`)         | None                                         | The sub-array                                       | No                                                     |
| 2    | method call (`each`)           | Each sub-array                              | None                                         | The calling object (sub-array in current iteration) | Yes, used to determin the return value of outer block  |
| 2-6  | inner block execution          | The inner item of sub-array (`18,7,3,12`)   | no                                           | `nil`                                               | No                                                     |
| 3    | comparison (`>`)               | The inner item of sub-array                 | no                                           | Boolean                                             | Yes, evaluated by `if`                                 |
| 3-5  | conditional (`if`)             | the inner item of sub-array                 | no                                           | `nil`                                               | yes, used to determine the return value of inner block |
| 4    | method call (puts)             | the inner item of sub-array (met condition) | output string representation of the integers | `nil`                                               | yes, it determins the return value of the inner block  |



Example 5

``` ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```



| Line | Action                | Object                            | Side Effect | Return Value                             | Is Return Value Used?                                 |
| ---- | --------------------- | --------------------------------- | ----------- | ---------------------------------------- | ----------------------------------------------------- |
| 1    | method call (`map`)   | The outer array (`[[1,2],[3,4]]`) | No          | New array (`[[2,4],[6,8]]`)              | no                                                    |
| 1-5  | outer block execution | Each sub array (`[1,2], [3,4]`)   | no          | `[2,4],[6,8]`                            | yes, used by top-level `map` for transformation       |
| 2    | method call (`map`)   | Each sub array (`[1,2], [3,4]`)   | no          | new array(`[2,4],[6,8]`)                 | Yes, it determins the return value of the outer block |
| 2-4  | inner block execution | Each element (`1,2,3,4`)          | no          | integers (`2,4,6,8`)                     | yes, used by inner`map` for transformation            |
| 3    | `num * 2`             | n/a                               | no          | an integer at each iteration (`2,4,6,8`) | yes, it determins the return value of the inner block |

