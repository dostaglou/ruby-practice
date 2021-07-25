## Logic Operators
Just like any other language, ruby has its owns way of handling basic logical operations. In this section we will go over the basic operators like Equality, NOT, AND, OR, if, else if, else, case-when, and ternaries.

### Equality
Comparisons of one object to another object are done with the `==` operator. This confirms if object A matches object B. For example: `"string" == "string"` comes out as `true`. Ruby is strongly typed unlike javascript and thus `"1" == 1` comes out as `false`. There is an optional `===` method. Unlike Javascript, `===` is not a stricter version of `==` and in almost all cases `==` is will be the stricter check.

There are optional checks as well. One of the more common ones is `is_a?(ClassName)`. This will confirm if the base object is version of that class. For example: `10.1.is_a?(Integer)` will return `false` as the Float `10.1` is not an integer. `10.1.is_a?(Numeric)` will return `true` as all Floats are a subclass of Numerics. You can see this in action with the following:

```ruby
class Bob # new class named bob
end

class Jo < Bob # new class named Jo that inherits from Bob
end

bob = Bob.new
jo = Jo.new

bob.is_a?(Bob) # => true
jo.is_a?(Jo) # => true
jo.is_a?(Bob) # => true

bob.is_a?(Jo) # => false
```

### NOT
Negation in ruby is done by applying an exclamation mark (`!`) to the start of an object. Thus `!true` is `false` and `!false` is `true`. In ruby `falsy` is define as `false` and `nil`. All other values are truthy, including `0` and `""`.

To confirm that two things are not equal to each other is it the same syntax as the Equality section above with the first `=` replaced by `!`. Thus `"string" != "other_string"` equals `true` and `1 != 1` equals `false`. Few ruby objects support `!==` so avoid this.

And of course one can repeatedly negate values `!!!!true` equals `true`.

### AND
AND is represented by `&&` and is a logical operator that confirms that both sides of the conjunction are true `true && false` => `false`. It will evaluate from the left to the right and so long as the left false, will not attempt the right. This can be a useful way of avoiding illegal method calls. For example `nil.map(&:to_i)` should a `NoMethodError` as `map` is not a method on `NilClass`. But `false && nil.map(&:to_i)` returns `false` and never attempts the second condition.

There is also the lowercase `and` operator in Ruby but it is probably best to avoid this for now. [StackOverflow Lini](https://stackoverflow.com/questions/1426826/difference-between-and-and-in-ruby)

### OR

OR is represented by `||` and is the logical operator that confirms that either side of a conjunction are true `false || true` => `true`. It will also evaluate from the left to the right and so long as the left is true, will not attempt the right. Thus similar to AND above, the expression `true || nil.map(&:to_i)` will return `true` and not trigger the NoMethodError.

There is also the lowercase `or` operator in Ruby but it is probably best to avoid this for now. [StackOverflow Lini](https://stackoverflow.com/questions/1426826/difference-between-and-and-in-ruby)

### If / Unless Conditions
Ruby ofters a simple condition flow that matches English quite easily. There are 1 line `if`s and `if` blocks. For example
```ruby
if x == "alpha"
  puts "it is alpha"
end

# vs

puts "it is alpha" if x == "alpha"
```

`unless` works the same way
```ruby
unless x == "alpha"
  puts "it is NOT alpha"
end

# vs

puts "it is NOT alpha" unless x == "alpha"
```

Continuing `if` blocks with alternate cases can be done with `elsif CONDITION`. Similarly, fallbacks are provided with `else`. Always end `if` blocks with an `end`. `unless` does not chain in this way.
```ruby
if x < 0
  puts "is negative"
elsif x == 0
  puts "is zero"
else
  puts "is positive"
end
```
### Case When
Case when blocks are ways to switch between various options in a series. They can be used to test equality to a `case` or establish easier to read `if` conditions. Just like `if` they can have a fallback with `else` and need to end with `end`. For example:

```ruby
my_string = "omega"
case my_string
when "alpha"   # this equals my_string == "alpha"
  puts "alpha"
when "beta", "gamma", "delta", "epsilon" # this equals (my_string == "beta" || my_string == "gamma" ...)
  puts "is between beta and epsilon"
else
  puts "is after epsilon"
end
```

The `case` statement does not require a declared instance; the `when` clauses can be evaluated on their own.
```ruby
my_num = 10
case
when my_num == 0
  puts "your number is 0"
when my_num.between?(1, 9)
  puts "your number is between 1 and 9"
else
  puts "your number is 10"
end
```

### Ternary
Ternaries in Ruby operate the same as javascript and evaluate a condition and then perform 1 of 2 actions based on the condition's boolean value. For example `1 > 0 ? "obviously" : "obviously not"` will return `obviously` as 1 is greater than 0. To set that return equal to a variable or print it in the console, that logic must precede the ternary: `answer = 1 > 0 ? "obviously" : "obviously not"` or `puts 1 > 0 ? "obviously" : "obviously not"`
