# frozen_string_literal: true

require_relative '../lib/main'

describe '#greetings_interpolation' do
  let(:response) { greetings_interpolation(name) }

  context 'name = Tu' do
    let(:name) { 'Tu' }

    it 'should return Howdy Howdy, Tu!' do
      expect(response).to eql 'Howdy Howdy, Tu!'
    end
  end

  context 'stripping the spaces' do
    let(:name) { '  Erika  ' }

    it 'should return Howdy Howdy, Erika!' do
      expect(response).to eql 'Howdy Howdy, Erika!'
    end
  end

  context 'proper capitalization' do
    let(:name) { 'christian' }

    it 'should return Howdy Howdy, Christian!' do
      expect(response).to eql 'Howdy Howdy, Christian!'
    end
  end
end

describe '#a_turn_of_phrase' do
  let(:response) { a_turn_of_phrase(phrase) }

  context 'two words' do
    let(:phrase) { 'two words' }

    it 'should return the phrase properly reversed' do
      expect(response).to eql 'Words two'
    end
  end

  context 'Three words now' do
    let(:phrase) { 'Three words now' }

    it 'should return the phrase properly reversed' do
      expect(response).to eql 'Now words three'
    end
  end

  context '1 word' do
    let(:phrase) { 'word' }

    it 'shoud just capitalize the word' do
      expect(response).to eql 'Word'
    end
  end

  context 'empty' do
    let(:phrase) { '' }

    it 'shoud just return an empty string' do
      expect(response).to eql ''
    end
  end
end

describe '#dyslexic_accounting' do
  context 'random number 1 to 10,000' do
    10.times do
      current_number = (1..10_000).to_a.sample

      it "should reverse correctly #{current_number}" do
        expect(dyslexic_accounting(current_number)).to eql current_number.to_s.split('').reverse.map(&:to_i).join
      end
    end
  end
end

describe "#alphabet_histogram" do
  options = [
    "simple",
    "this is a random string of characters that I am using for this example",
    "Once there was a man from Nantucket who really loved to...",
    "What will we do with a drunken sailor? What will we do with a drunken sailor? What will we do with a drunken sailor?"
  ]

  options.each do |option|
    context "for the sentence: #{option}" do
      it "should return the correct histogram" do
        expect(alphabet_histogram(option)).to eql option.downcase.split("").group_by { |x| x }.transform_values { |v| v.size }
      end
    end
  end
end
