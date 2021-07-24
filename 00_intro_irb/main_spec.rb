# frozen_string_literal: true

require_relative 'main'

describe 'personalized_hello_two' do
  it 'should return a simple greeting' do
    expect(personalized_hello_two("Dillon", "Wyatt")).to eql 'Howdy Howdy, Dillon Wyatt'
  end

  # In main.rb, the test above is expecting this kind of declaration to pass

  # def personalized_hello_two(first_name, last_name)
  #   "Howdy Howdy, #{first_name} #{last_name}"
  # end
end
