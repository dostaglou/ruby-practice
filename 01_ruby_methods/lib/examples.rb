my_string = "this is a string"
my_array = (1..10).to_a
my_hash = { one: 1, two: 2, deeper: [{ wow: "wow", }, 3] }

# LP equals "Learning Point"
my_string.capitalize            # LP: how to call a method on an obj
my_string.empty?                # LP: the ? naming convention
my_string.gsub("this", "that")  # LP: some built in methods take arguments
my_string.upcase!               # LP: the destructive ! naming convention

my_array.select { |x| x.odd? }         # LP: The {} block notation for some methods
my_array.select do |x| x % 5 == 0 end  # LP: The do code end block notation for some methods
my_array.select(&:even?)               # LP: The &:method notation for some methods


my_array.map { |x| x * 2 }   # LP: re-enforcing the return even on similar methods can be different
my_array.each { |x| x * 2 }  # LP: Tied to the above

my_hash.each { |k, v| puts k; puts v }
# LP1: blocks can have multiple args; hashes often make use of it
# LP2: new lines can be mimiced with ; notation. New lines are better, though

my_hash.each { |k, _v, _| puts k } # LP: when an argument isn't used, convention is to put a _ before it or only use _ by itself

my_hash.dig(:deeper, 0, :wow) # LP: Just some fun with dig

my_hash.merge({ three: 3, two: 22, "two" => 2, "three": 4 })
# LP1: Hashes have 2 options: symbol notation ( three: 3 ) and "Fat Arrow" notation ( "two" => 2 )
# LP2: Realization that :"three" == :three, and that the last item in a merge supercedes any prior declarations
# LP3: "two" => and :two are not equivalents as "two" occupies a different space in memory to :two while :"three" and :three occupy the same

my_array.map.with_index(1) { |x, index| x * index } # LP: some methods can be chained and have a single block passed
