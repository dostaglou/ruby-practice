def haiku?(poem)
  lines = poem.split("\n")

  return false if lines.size != 3

  return false if lines[0].split(" ").size != 5

  return false if lines[1].split(" ").size != 7

  return false if lines[2].split(" ").size != 5

  true
end

def fizzbuzz_counter(array)
  fizz_count = 0
  buzz_count = 0
  fizzbuzz_count = 0

  array.each do |int|
    case
    when int % 5 == 0 && int % 3 == 0
      fizzbuzz_count += 1
    when int % 5 == 0
      buzz_count += 1
    when int % 3 == 0
      fizz_count += 1
    end
  end

  { fizz: fizz_count, buzz: buzz_count, fizzbuzz: fizzbuzz_count }
end
