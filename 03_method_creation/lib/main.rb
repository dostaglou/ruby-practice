# Task 1
# Define a method called argument_organizer.
# It will take N number of positional arguments
# Each argument will be an integer, a float, or a string representing an integer or float
# It will return a single array of the passed arguments which will be transformed into floats and sorted smallest to largest

### Task 1 code goes here
# Use rake argument_organizer in terminal to run tests

# Task 2
# Define a method called valid_data_type?
# It will take a set of keys called: :string, :float, :integer
# When called, each key passed will be an array of data ( string: ["abc", "xyz"], hash: [{one: 1}, { bob: "ross" }] )
# Some keys may not be sent so assume that keys that are not sent are empty arrays,
#   thus valid_data_type? called with no arguments should not cause an error
# For each argument, the data validator will check if all of the data in the arrays matches the name of the key
#   thus string: ["abc"] = pass will pass and return TRUE but string: ["abc", 1.123] = fail and will return FALSE
# If any data fails ( 2 keys of data passed and 1 fails ), then it returns false

### Task 2 code goes here
# Use rake valid_data_type? in terminal to run tests
