def greetings_interpolation(name)
  "Howdy Howdy, #{name.strip.capitalize}!"
end

def a_turn_of_phrase(sentence)
  sentence.downcase.split(" ").reverse.join(" ").capitalize
end

def dyslexic_accounting(number)
  number.to_s.reverse.to_s
end

def alphabet_histogram(string)
  stirng.downcase
        .split("")
        .group_by { |x| x }
        .transform_values { |v| v.size }
end
