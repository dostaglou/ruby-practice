## Ruby Methods
Ruby has many built in methods. These methods can be used to accomplish a variety of tasks. The methods discussed in this section will be ones that belong to various data types and can be called upon objects.

### Basic notation
Methods are invoked using dot notation with the method name. `["Foreign", "Orchid"].join` is an example of an Array method that is called upon an Array object with the `.join` and will return the string `"ForeignOrchid"`.

Some methods may take arguments and some may not. `.join` is an example of one that can be given an additional argument or not. `["Foreign", "Orchid"].join("_")` will return the string `"Foreign_Orchid"` because the optional argument of join is the String spacer character used when joining to items in an array.

Some methods take special arguments called `blocks`. These blocks provide the argument more information on what to do next. `["Foreign", "Orchid"].map { |entry| entry.upcase }` is an example of passing a block to a method. Blocks can be written 2 ways, the above uses the curly bracket notation. After the method name, provide a space and start a curly bracket. Then provide a pair of pipes `||`. In between the pipes, provide the local variable name. In this case `map` will pass `"Foreign"` and then `"Orchid"` to the block as `entry`. Sometimes a method may take multiple local variables, in those cases separate them using `,` for example `|key, value|`. After this, insert the code that should be executed followed by `}`. In the above example, we want to make all the letters big so we do `entry.upcase`. Ultimately this returns `["FOREIGN", "ORCHID"]`.

Typically the curly bracket notation is used when the code is 1 line of easy to grasp code. When the actions taken inside the block are more complex, it is best to use `do` `end` notation. An example of that is as follows:
```ruby
["Foreign", "Orchid"].map do |entry|
  alteration = entry.downcase
  alteration = alteration.reverse
  alteration.capitalize
end
```

The above code will return an array of `["Ngierof", "Dihcro"]`.

### Chaining methods
Methods in ruby can be "chained". So long as the return from the previous method is of the correct type, another method can be called upon the result. In our example of `do` `end` notation above, we did 3 distinct actions. We could chain these all in a single line of code
```ruby
["Foreign", "Orchid"].map { |entry| entry.downcase.reverse.capitalize }
```

Sometimes individual methods that will be chained need to pass their own blocks. In these cases the dot notation can follow the `}` or even the `end` although for readability, it is generally best to not chain dot notation on an `end` and to break out chains on `}` onto new lines. For example:
```ruby
["Foreign", "Orchid"].map { |entry| entry.downcase }
                     .map { |entry| entry.reverse }
                     .map { |entry| entry.capitalize }
```

The above achieves the same goal the first one in this section ( but slower ) and is only an example of chaining.

### Ruby Method Lists
There are numerous methods in ruby but here are links to the Ruby API docks describing methods for the basic types

String Methods: https://ruby-doc.org/core-3.0.2/String.html
Integer Methods: https://ruby-doc.org/core-3.0.2/Integer.html
Float Methods: https://ruby-doc.org/core-3.0.2/Float.html
Enumerable Methods ( Arrays and Hashes ): https://ruby-doc.org/core-3.0.2/Enumerable.html
Array Methods: https://ruby-doc.org/core-3.0.2/Array.html
Hash Methods: https://ruby-doc.org/core-3.0.2/Hash.html
Range Methods: https://ruby-doc.org/core-3.0.2/Range.html

From the above there are many commonly used methods you will see:
String: `upcase`, `downcase`, `capitalize`, `empty?`, `gsub`
Enumerable: `each`, `map`, `any?`, `find`, `select`, `sort`, `inject`, `dig`
Array: `include?`, `compact`, `flatten`, `first`, `last`, `<<`
Hash: `key?`, `keys`, `values`, `merge`, `transform_values`

### Boolean and Destructive Methods
There are a simple conventions in ruby regarding the use of `?` and `!`. `?` methods always return a boolean. `!` are destructive and mutate the values in place. This means that the following two code blocks are quite different in their outcomes:

```ruby
first_3 = [1, 2, 3]
second_3 = [4, 5, 6]

first_3_stringified = first_3.map { |x| x.to_s }
second_3_stringified = second_3.map! { |x| x.to_s }

# first_3 continues to equal [1,2,3]
# second_3 now equals `["4", "5", "6"]
```

It is important to confirm the behavior of `!` methods in the docs and generally only use them if there is no need to preserve the original data.
