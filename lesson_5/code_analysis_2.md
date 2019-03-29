Example 6

``` ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```



| Line | Action                 | Object                                                       | Side Effect | Return Value                                                 | Is Return Value Used?                                      |
| ---- | ---------------------- | ------------------------------------------------------------ | ----------- | ------------------------------------------------------------ | ---------------------------------------------------------- |
| 1    | method call (`select`) | An array                                                     | no          | An array containing elements of original array; or nil    (`[c: 'cat']`) | no                                                         |
| 1-5  | outer block execution  | Each hash in the array (`{a: 'ant', b: 'elephant'}, {c: 'cat'}`) | no          | boolean (`false`, `true`)                                    | yes, used by `select` for determine which object to select |
| 2    | method call (`all?`)   | Each hash in the array (`{a: 'ant', b: 'elephant'}, {c: 'cat'}`) | no          | boolean (`false`, `true`)                                    | yes,  used to dertermin the return value of outer block    |
| 2-4  | inner block execution  | Each hash pair                                               | no          | boolean (`true, false`, `true`)                              | yes, used by `all?` for determin it's return value         |
| 3    | `value[0]== key.to_s`  | n/a                                                          | no          | boolean (`true,false,true`)                                  | yes, used to determin the return value of inner block      |
|      |                        |                                                              |             |                                                              |                                                            |
|      |                        |                                                              |             |                                                              |                                                            |



Example 7

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
# To sort the above array by numerical order:
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```



| Line | Action                  | Object                          | Side Effect | Return Value                                                 | Is Return Value Used?                             |
| ---- | ----------------------- | ------------------------------- | ----------- | ------------------------------------------------------------ | ------------------------------------------------- |
| 1    | method call (`sort_by`) | The outer array                 | no          | The sorted outer array                                       | no                                                |
| 1-5  | outer block execution   | Each inner array                | no          | new transformed arrays (`[1,8,11]`,`[2,,6,13]`,`[2,12,15]`,`[1,8.9]`) | yes, used by `sort_by` for comparison             |
| 2    | method call (`map`)     | Each inner array                | no          | new transformed array (`[1,8,11]`,`[2,,6,13]`,`[2,12,15]`,`[1,8.9]`) | yes, it determins the return value of outer block |
| 2-4  | inner block execution   | Each element within inner array | no          | an integer                                                   | yes, used by `map` for transformation             |
| 3    | `num.to_i`              | n/a                             | no          | an integer                                                   | yes, it dermins the return value of inner block   |

