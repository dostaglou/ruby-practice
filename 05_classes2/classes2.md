### Class in Ruby 2.0

In the previous lesson the concept of a class was initially introduced. In this one the concept will be expanded upon in 4 key ways: Class Inheritance, Class level Variables, Class vs Instance methods, privacy.

### Class Inheritance

Classes attempt to represent some singular conceptual concept of value. A zoologist might have each species have its own class. Thus there would be a Tiger class and a Lion class. But both of these share many common traits and thus are part of another class called Panthera. Thus Lions and Tigers both inherit many of their characteristics from Panthera. Thus we could model this with the following

```ruby
class Panthera
  attr_reader :diet, :roar_or_purr
  def initialize(diet: "carnivore", roar_or_pur: :roar)
    @diet = diet
    @roar_or_pur = roar_or_pur
    @likes_water = likes_water
  end

  def humans_are
    "yummy"
  end
end

class Tiger < Panthera
  attr_reader :fur_type
  def initialize(**kwargs)
    @fur_type = kwargs[:fur_type]
    super
  end
end

class SnowLeopard < Panthera
  def initialize(**kwargs)
    super(kwargs.merge(roar_or_pur: :pur))
  end

  def humans_are
    "scary"
  end
end

class Lion < Panthera end
```

In the example above we can 4 classes, 3 of which inherit ( `<` ) from the first one `Panthera`. Panthera comes complete with an initialize method along with a `humans_are` method. By default, all children of a class have all the same methods of the parent class. Thus `Lion`, which implements no new values has an `initialize` and `humans_are`. When calling `Lion.new`, Ruby will look for an explicit initialize method on the `Lion` class. As there is none, it will go one class up and look again and repeat until it finds one. Same thing for `humans_are`.

On the `Tiger` class, it accepts initialization arguments and from those creates a new `fur_type` instance variable. This variable has its own attribute reader uniq to Tiger and no other members of Panthera have it. During the creation, though, the Tiger class calls `super`. `super` is a Ruby keyword for classes that says "take all the arguments sent to this method and call the parent class's method by the same name". Thus `kwargs` are passed up to Panthera. Although this does mean `fur_type` is also passed up, since nothing is done with it, there is no extra fallout.

By contrast, the `SnowLeopard` does something different. It calls super but passes up a modified set of arguments. In this case modifies/adds the `roar_or_pur: :pur` set to the values passed up. When `super` is called and passed arguments, those arguments are the only ones sent up to the parent class. Similarly, `SnowLeopard` has its own `humans_are` method which returns "scary"; thus overriding the Panthera base method.


### Class Level Variables

We already learned of instance_variables which are marked with the `@` symbol. When you create a new instance of a class and you want its specific values to be accessible elsewhere for that instance, we use that classification of variable. But sometimes variables are shared between ALL instances of a class. In this situation, there are class_variables which are marked with the double `@@` symbol. Example:

```ruby
class Person
  attr_accessor :name
  @@population = 0
  def initialize(name:)
    @name = name
    @@population += 1
  end

  def population
    @@population
  end
end
```

In the above we have the class `Person` which has the `instance_variable` of `@name`. And with its attr_accessor, we can read and write the name variable. There is also a new `@@population` variable which exists pre-set to 0 but every time `Person.new` is called, it is incremented up. Thus if we do the following
```
bob = Person.new(name: "bob")
mary = Person.new(name: "mary")
ash = Person.new(name: "ash")
```
and then call `.population` on each variable: bob, mary, and ash, they would return `3`. Thus the scope of `@@` class_variables is the class itself, including all instances of it.

### Class vs Instance methods
In the above we discussed the distinction between `@` and `@@` variables but there is a similar distinction between class and instance `methods` as well. A class method is called on the class as a whole where as an instance method is called on a single iteration of that class. For example:

```ruby
class Worker
  @@employment_total = 0
  @@name_registry = []

  def self.make_more_workers
    [new("bob"), new("jotaro"), new("mary"), new("aiko")]
  end

  def initialize(name)
    @name = name
    @@employment_total += 1
    @@name_registry << name
  end

  def self.employment_total
    @@employment_total
  end

  def shared_name_total
    @@name_registry.count { |name| name == self.name } # @name also works
  end
end
```
In the above class, `Worker` there are 2 methods that start as `def self.xyz`. The `self` in this case indicates that it is a class method. Thus if we create a instance of worker, `bob` and do `bob.make_more_workers` or `bob.employment_total`, they will return NoMethod errors as `bob` is an instance of `Worker` but is not the class `Worker` itself. We can, however, do `Worker.make_more_workers` which will create 4 new instances of Worker. And we can even call `Worker.employment_total` which will then tell us that there are 4 workers after creating them previously. We can not, however, do `Worker.shared_name_total` as this is an instance only method.

From earlier we learned about class variables and every time a new worker is created, their name is added to the name_registry array. In the `shared_name_total`, we can call it on `bob` and see that there is only 1 ( no one shares his name yet ). In the method we utilize the keyword `self` which, internal to the method means something different than `self` when at the method declaration level. `self` in this case refers to the Instance of `Worker` which is `bob` in our case. It does not refer to `Worker` as a whole. Thus why @name would be an equal substitute.

### Privacy
In Ruby there are two similar concepts: private & protected. These are ways of obscuring methods in classes so as to restrict who can call them. As we will learn at the end, no methods in Ruby are truly restricted, only the hoop one must jump is different.

```ruby
class ImPrivate
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def increment_value
    update_value(1)
  end

  def decrement_value
    self.update_value(-1)
  end

  private

  def update_value(val)
    @value += val
  end
end
```

In the above example we can create an instance of class `imp = ImPrivate.new(1)`. We can read the value `imp.value` and get 1. We then have 2 methods `increment_value` and `decrement_value`. Both will attempt to call `update_value`. The `private` keyword before `update_value` means that the method will only accept internally called methods. Internally called means `from within the class itself with an 'implicit' self declaration`. It is that "implicit" part that is key here.

`increment_value` names the method it wants without first declaring the source of the method. No `ImPrivate.` or `self.` etc. The implication is `self.update_value`. Thus the condition for calling the private method is met and the method will increment the value.

`decrement_value` names the method it wants and states where the method is called from explicitly: `self`. `self` calls the method. But since the method is `private` it must be called internally. Conceptually this can be a bit confusing but think about it as the difference between talking to yourself in your head and talking to yourself out-loud. Both versions of talking to yourself are very similar but only one is truly "private".

`protected` is a slightly less restrictive version of `private`. It would allow `decrement_value` to work because it is called on `self`.

Neither version allows `imp.update_value(2)` to work. Both version will return a `NoMethodError`. The only way for `imp` to update the value is to utilize the `increment_value` or `decrement_value`.

One way around this is to use the `send` method. `send` accepts the Symbol name for a method plus any arguments to be sent to the method. It can completely by-pass the private limitation. Thus `imp.send(:update_value, 3)` will update the `@value`.

Of note, `private` and `protect` have no other major function. They do not, for example, prevent the inheritance of a method by subclasses as Java does. If `Panthera` above had a private method, `Tiger` would have the exact same access to it as `Panthera` does.

If you want to know what methods exist on a class, you can do `ClassName.methods` and it will return a list of Symbols for all the methods. Similarly `ClassName.private_methods` will return a list of Symbols for all the private or protected methods.
