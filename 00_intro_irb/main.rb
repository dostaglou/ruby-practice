# HelloWorld display

puts "Hello World"

# HelloWorld via a method
def hello_world
  puts "hello world"
end

# hello_world

def help_me_world
  "Thanks for helping!"
end

help_me_world

# Personalized Hello using user feedback

def personalized_hello
  puts "What is your name?"
  name = gets.chomp
  puts "It is such a pleasure to meet you, #{name}"
end

# personalized_hello

def personalized_hello_two(name)
  "Howdy Howdy, #{name}"
end

personalized_hello_two("Dillon")
