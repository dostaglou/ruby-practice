#
# Takes a name and returns the string "Howdy Howdy, NAME!"
# Additionally must remove white spaces around the name and use standard english capitalization
# for example "  bOB " => "Bob"
#
# @param [String]   name    Any ruby string, typically a name
#
# @return [String]  A string containing the name
#
# Test with `rake greetings_interpolation` from the 01_ruby_methods directory
def greetings_interpolation(name)
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
# Test with `rake a_turn_of_phrase` from the 01_ruby_methods directory
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
# Test with `rake dyslexic_accounting` from the 01_ruby_methods directory
def dyslexic_accounting(number)
  # code goes here
end

#
# Takes a single string sentence and returns a Hash histogram of the letters.
# Thus "Apple" returns { "a" => 1, "p" => 2, "l" => 1, "e" => 1}
# Note, it should be case insensitive so "A" and "a" both get reduced to "a"
#
# @param [String] string
#
# @return [Hash<char => count>] Hash of individual letters / characters and their frequency in the string
#
# Test with `rake alphabet_histogram` from the 01_ruby_methods directory
def alphabet_histogram(string)
  # code goes here
end
