# Background:
# American and British English count floors differently. The base level of a building in the US is
# called the 1st floor and counts up from there. The base level of a building in Britain is the
# "ground floor" and then counts up from there treating "ground floor" as 0. Similarly, the 13th
# floor in the US is unlucky and thus the floors goes from 12th to 14th. Basement floors are counted
# the same from basement 1 onward.
#
# Method:
# Takes a floor Integer, a starting dialect ( american or british ) and an output dialect ( american
# or british ) and returns what that floor would be the output dialect. An example of this is:
# floor_translator(2, "british", "american") => 3
# floor_translator(1, "american", "british") => "ground"
# floor translator(-1, "british", "british") => "b1"
#
# Special consideration that 13 is not an acceptable american output and should be 14.
# Assume all floors after 13 in american have been adjusted upwards to avoid the bad number.
#
# @param [Integer]  floor             an integer
# @param [LangEnum] start_language    "american" or "british"
# @param [LangEnum] output_language   "american" or "british"
#
# @return [String|Integer] Either a string for "ground" or "bx" or an integer for all other cases
#
def floor_translator(floor, start_dialect, output_dialect)
  # code goes here
end

#
# Takes a single array of positive itegers and returns the a Hash.
# The hash will have the keys :fizz, :buzz, :fizzbuzz with each's value being the number of times
# eahc fizz, buzz, or fizzbuzz number appear in the array.
# A fizz number is a number divisible by 3
# A buzz number is a number divisible by 5
# a fizzbuzz number is a number divisible by both 3 and 5
# These need to be exclusive, there for [15] results in { fizz: 0, buzz: 0, fizzbuzz: 1 }
#
# @param [Array<Int>] array
#
# @return [Hash<:fiz, :buzz, :fizzbuzz>]
#
def fizzbuzz_counter(array)
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
# Test with `rake haiku` from the 01_ruby_methods directory
def haiku?(poem)
  # code goes here
end
