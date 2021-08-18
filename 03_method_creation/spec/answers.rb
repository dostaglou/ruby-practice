def argument_organizer_answer(*args)
  args.map { |x| x.to_f }.sort
end

def valid_data_type_answer(string: [], float: [], integer:[])
  string.all? { |x| x.is_a?(String) } && float.all? { |x| x.is_a?(Float) } && integer.all? { |x| x.is_a?(Integer) }
end
