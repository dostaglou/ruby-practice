# frozen_string_literal: true

require_relative '../lib/main'

describe '#greetings_interpolation' do
  let(:response) { greetings_interpolation(name) }

  context 'name = Dillon' do
    let(:name) { 'Dillon' }

    it 'should return Howdy Howdy, Dillon!' do
      expect(response).to eql 'Howdy Howdy, Dillon!'
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

  context 'stripping the punctuation from the end' do
    let(:name) { "Kevin,.!\"'" }

    it 'should return Howdy Howdy, Kevin!' do
      expect(response).to eql 'Howdy Howdy, Kevin!'
    end
  end

  context 'stripping the punctuation from the middle' do
    let(:name) { "T,.!\"'K" }

    it 'should return Howdy Howdy, Tk!' do
      expect(response).to eql 'Howdy Howdy, Tk!'
    end
  end

  context 'stripping the punctuation from the start' do
    let(:name) { ",.!\"'Tk" }

    it 'should return Howdy Howdy, Tk!' do
      expect(response).to eql 'Howdy Howdy, Tk!'
    end
  end

  context 'all the things' do
    let(:name) { ",.!\"' dillon ,.!\"'" }

    it 'should return Howdy Howdy, Dillon!' do
      expect(response).to eql 'Howdy Howdy, Dillon!'
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

describe '#haiku?' do
  let(:response) { haiku?(poem) }

  context 'acceptable haiku' do
    let(:poem) { "this is a real haiku\n yes it's really a simple English haiku \n no matter what others say" }

    it 'should return true' do
      expect(response).to eql true
    end
  end

  context 'unacceptable haiku - too many lines' do
    let(:poem) { "this is a real haiku\n \n yes it's really a simple English haiku \n no matter what others say" }

    it 'should return true' do
      expect(response).to eql false
    end
  end

  context 'unacceptable haiku - too few lines' do
    let(:poem) { "this is a real haiku yes it's really a simple English haiku no matter what others say" }

    it 'should return true' do
      expect(response).to eql false
    end
  end

  context 'unacceptable haiku - word count line 1' do
    let(:poem) { "this isn't a real haiku, nope\n yes it's really a simple English haiku \n no matter what others say" }

    it 'should return true' do
      expect(response).to eql false
    end
  end

  context 'unacceptable haiku - word count line 2' do
    let(:poem) { "this isn't a real haiku\n no it's really not a simple English haiku \n no matter what others say" }

    it 'should return true' do
      expect(response).to eql false
    end
  end

  context 'unacceptable haiku - word count line 3' do
    let(:poem) { "this isn't a real haiku\n no it's really not an English haiku \n no matter what others say about it" }

    it 'should return true' do
      expect(response).to eql false
    end
  end
end
