#
# Takes a name and returns the string "Howdy Howdy, NAME!"
# Additionally must remove white spaces around the name and use standard english capitalization
# for example "  bOB " => "Bob"
# Lastly remove any accidentally included standard punctuation ( , . ! " ' )
#
# @param [String]   name    Any ruby string, typically a name
#
# @return [String]  A string containing the name
#
# Test with `rspec 01_ruby_methods/spec/main_spec.rb:5`
def greetings_interpolaton(name)
  # code goes here
end

#
# Takes a string sentence of 0 or more words and reverses them and changes capitalization to fit standard English
# "This is AN example" => "Example an is this"
# No punctuation will be included in examples
#
# @param [String] sentence An unpunctuated string
#
# @return [String] the original string reversed
#
# Test with `rspec 01_ruby_methods/spec/main_spec.rb:65`
def a_turn_of_phrase(sentence)
  # code goes here
end

#
# Takes a single positive integer and returns that integer reversed
# 24521 => 12542
#
# @param [Integer] number A single positive Integer
#
# @return [Integer] A single positive integer
#
# Test with `rspec 01_ruby_methods/spec/main_spec.rb:101`
def dyslexic_accounting(number)
  # code goes here
end

#
# Takes a string that potentially includes line breaks \n. Determines if the string contains a Haiku
# For this exercise an English Haiku contains 5 words on 1 line, 7 words on the next, and 5 on the last
#
# @param [String] poem A string potentially containing a Haiku
#
# @return [Boolean] True if there is a Haiku and false if not
#
# Test with `rspec 01_ruby_methods/spec/main_spec.rb:113`
def haiku?(poem)
  # Code goes here
end
