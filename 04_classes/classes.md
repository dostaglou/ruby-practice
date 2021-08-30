### Classes in Ruby
[RubyDoc Guide to Classes](https://ruby-doc.org/core-3.0.0/Class.html)

"Classes in Ruby are first-class objects—each is an instance of class Class."

The above definition is only slightly circular. But in essence in Ruby there is an object called `Class`. From this basic object, new classes can be declared using the following syntax `class Name`. `class` is a root level method that takes a global constant (capitalized single word). From that it will register that class and allow the instantiation of it using that keyword. Example:

```ruby
class Cat
end

my_cat = Cat.new
```

The `Class` object stores in its registry that a class called `Cat` exists. `Cat` is abstract and could refer to any number of individual cats. To create a single individual cat, we call the `.new` method on the new class. Thus `Cat.new`. This gives us a new instance.

The `.new` method is a method on the `Class` object that calls a method called `initialize` with any arguments passed to it from the new class. In this case no method name `initialize` has been named on `Cat`, so if arguments are given, it will cause an error. But every cat needs to have a name so let allow new instances of `Cat` to have a name with the following:

```ruby
class Cat
  def initialize(name)
    @name = name
  end
end

dilly = Cat.new("Dilly")
```

In the above `"Dilly"` is passed to the `initialize` method and `@name` is set to that value. `@` is an important symbol as it marks what are called `instance variables`. These are variables that, inside the scope of a single instance of a class, are accessible. At the moment, there are no methods on the Class to help display this. So let edit this to have one:

```ruby
class Cat
  def initialize(name, sound = "meow")
    @name = name
    @sound = sound
  end

  def speak
    puts @sound
  end
end

dilly = Cat.new("Dilly")
sneeze = Cat.new("Sneeze", "achoo-!")

dilly.speak
sneeze.speak
```

Now on the variable `dilly` which is an instance of the class `Cat`, we can access the method `speak` by using standard dot notation. `speak` takes no variable but because `sound` is scoped to the whole class of `Cat`, it is accessible. Although dilly wasn't given a particular sound, the initialize method has a default value for cats of `meow`. Sneeze was given a value for it so sneeze and dilly will produce different sounds. The `@` symbol merely makes variables accessible for a single instance and dilly and sneeze are both single instances. Merely hearing the cats speak isn't enough. Let's say I want to `get` the name of the cat or want to `set` a new name for the cat, this can be done like so:

```ruby
class Cat
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(val)
    @name = val
  end
end

dilly = Cat.new("Dilly")

dilly.name #=> "Dilly"
dilly.name = ("Little Princess")
dilly.name #=> "Little Princess"
```

We have have a custom `getter` and `setter` for name. Ruby is smart enough to understand that methods define as `attribute=` can be invoke with or without the space around the `=`. Thus `dilly.name=("name")` works just as well as `dilly.name = "name"`. But the internal method needs to be define without spacing `name=()`.

Because it is an extremely routine thing to do to have getters and setters for various values, ruby has a built in method to handle all of them: `attr_reader`, `attr_writer`, and `attr_accessor` all of which take symbols of the relevant values. For example:

```ruby
class Cat
  attr_reader :name
  attr_accessor :sound, :age
  def initialize(name, sound = "meow", age = 0)
    @name = name
    @sound = sound
    @age = age
  end
end

dilly = Cat.new("Dilly")
dilly.sound
dilly.age=(1)
dilly.name
```

Now the sound and age can be requested using dot notation or even updated because the `attr_accessor` creates the internal getter and setter methods for sound and age. However, while the `name` can be read, it can not be altered. An `attr_writer` is the opposite side of a reader.
