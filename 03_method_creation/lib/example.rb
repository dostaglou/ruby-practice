# Positional Arguments
def my_positional_arg_method(one, two)
  # code
end

# Keyword Arguments
def my_keyword_arg_method(one:, two:)
  # code
end

# Block argument
def my_block_arg_method(&block)
  # code
end

# Mixed arguments
def my_mixed_arg_method(one, two, three:, four:, &block)
  # code
end

# Splat positional + Splat keyword
def my_spatter_arg_method(*args, **kwargs, &block)

end

# Encircling Splatted positional
def my_encircling_arg_method(first, *args, last)

end

# Yield control to a block if given
def my_yielding_method(*args, &block)
  yield args if block_given?
end

# What do we think is returned here?
my_yielding_method(*(1..5).to_a) { |x| x * 2 }
