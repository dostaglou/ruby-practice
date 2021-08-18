## Ruby Methods
[Documentation for Calling Methods](https://ruby-doc.org/core-3.0.2/doc/syntax/calling_methods_rdoc.html)

Previously we aimed at utilizing built in ruby methods. Calling those methods on particular objects to arrive at a goal. In this section we discuss the basics of writing our own methods.

### Defining a method

#### Declarations
Methods in ruby are instantiated using the key word `def` paired with `end`. This create a block of code that will be stored in memory and can be accessed later. Methods are stored in memory via symbol notation. Thus the method declared as `def do_something` will be stored as `:do_something`. This is important to know as it gives you a quick way to see what methods are available on any ruby object. In IRB you can try `"my string".methods` and be returned a full array of method names. Using this, one can quickly check what methods are available on a particular object.

In IRB try out the following
```ruby
methods1 = String.methods.sort
methods2 = "string".methods.sort
methods1 == methods2
```

What were your expectations for whether `methods1` and `methods2` would be equivalent? In truth they are not. What are your intuitions for why they aren't? Why they are not is explained at the end of this file.

#### Arguments
Methods in ruby can accept arguments as we have seen in previous lessons. In a broad sense, there are 3 types of arguments a method can receive: *Positional Arguments*, *Keyword Arguments*, and *Block*. Thus the following is possible

```ruby
def my_method(position1, position2, :keyword1, :keyword2, &block)
  puts position1
  puts position2
  puts keyword1
  puts keyword2
  yield self if block_given? # yields control to the passed block
end
```
Positional arguments let you declare what the variable passed first, second, etc, will be called for the duration of that method. Thus even if `"bob"` is passed first in the method above, it will be named `position1`. Keyword arguments can allow one to disregard the order of the arguments so long as they key words are respected. Thus the above could be invoked with `my_method("bob", "", keyword2: "num2", keyword1: "num1")`. Note that even though `&block` is declared, I can invoke it without passing a block. This does not raise an ArgumentError. However, if the `if block_given?` is removed, it will raise a `LocalJumpError` as the method will try to yield to a block that is non-existent.

Additionally, arguments MUST be passed in the order above: Positional, Keyword, Block. Trying to place Keyword arguments before positional ones will raise an error. Thus the following is unacceptable `my_method(keyword:, position)`.

*Default Values* can also be assigned to the arguments in a method. The way to do so for Positional and Keyword arguments is slightly different but very straight forward in both cases. The following does both: `my_method(position = "default value", keyword: "default value")`.

#### Argument deconstruction / Splatting arguments
Ruby offers a splat operation for deconstructing Arrays and Hashes into positional and keyword arguments easily. Similarly it offers the same kind of tool for capturing unspecified positional and keyword arguments. The two relevant splat operators are `*` for deconstructing an Array into positional arguments and `**` for deconstructing a Hash into keyword arguments.

```ruby
array = [1, 2, 3]
hash = { one: 1, two: 2 }

my_method1(array, hash)
```

The above calls `my_method1` with two positional arguments. But I really want each item in the array to correspond to a positional argument or each item in the hash to correspond to a keyword, I can transform the call like below:

```ruby
array = [1, 2, 3]
hash = { one: 1, two: 2 }

my_method2(*array, **hash)
```
The end result is that `my_method2` isn't called with two positional arguments but a number of positional arguments equal to the size of the array (3) and a number of keyword arguments equal to the size of the hash (2). So the method would generally need to look different. Below are the two methods if written explicitly:

```ruby
def my_method1(array, hash)
end
def my_method2(item1, item2, item3, one:, two:)
end
```

Sometimes it is hard to know exactly which arguments the method will be called with. Or perhaps you know explicitly a couple but not all possible. In these cases is it possible to utilize the same splat operators to indicate that some arguments passed to a method are unknown ahead of time. Utilizing the examples above, one way to condense `my_method2` down would be to write it as `my_method2(*args, **kwargs)`. `*args` and `**kwargs` are simple convention standing in for `arguments` and `keyword_arguments` but there is no set rule that they need to retain this naming pattern.

```ruby
def my_method3(*args)
  p args
end

my_method3("one", "two")
```

What will occur in the above is that `my_method3` will be passed 2 positional arguments. These will be condensed into a single array containing both. Thus the `p args` will output `["one", "two"]`. There is a similar action done with **kwargs as shown below

```ruby
def my_method4(**kwargs)
  p kwargs
end

my_method4(jo: "joey", bob: "bobby")
```

The result from the `p kwargs` will be a Hash of `{jo: "joey", bob: "bobby"}` which can be accessed normally; `kwargs[:jo]` provides `"joey"`

Methods can declare `*args` as a parameter and capture all positional args in a single array called args but there is one more option available with these which is to pick off a few at the start or end of set. Thus it is possible to declare the following

```ruby
def my_method5(first, *args, last)
  p first
  p args
  p last
end

my_method5(1, 2, 3, 4, 5)
```
The above will result in `1` being put in terminal followed by `[2,3,4]` and then finally `5`.
