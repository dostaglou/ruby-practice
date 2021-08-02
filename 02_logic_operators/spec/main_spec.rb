# frozen_string_literal: true

require_relative '../lib/main'

describe "#floor_counter" do
  let(:response) { floor_counter(int, start, output) }

  context "british -> american" do
    let(:start) { "british" }
    let(:output) { "american" }

    context "-5" do
      let(:int) { -5 }

      it "should return b5" do
        expect(response).to eql "b5"
      end
    end

    context "0" do
      let(:int) { 0 }

      it "should return 1" do
        expect(response).to eql 1
      end
    end

    context "13" do
      let(:int) { 13 }

      it "should return 14" do
        expect(response).to eql 14
      end
    end
  end

  context "american -> british" do
    let(:start) { "american" }
    let(:output) { "british" }

    context "-5" do
      let(:int) { -5 }

      it "should return b5" do
        expect(response).to eql "b5"
      end
    end

    context "1" do
      let(:int) { 0 }

      it "should return ground" do
        expect(response).to eql "ground"
      end
    end

    context "14" do
      let(:int) { 14 }

      it "should return 12" do
        expect(response).to eql 12
      end
    end
  end
end

describe "#fizzbuzz_counter" do
  def determine_answer(array)
    fizz_count = 0
    buzz_count = 0
    fizzbuzz_count = 0

    array.each do |int|
      case
      when int % 5 == 0 && int % 3 == 0
        fizzbuzz_count += 15
      when int % 5 == 0
        buzz_count += 1
      when int % 3 == 0
        fizz_count += 1
      end
    end

    { fizz: fizz_count, buzz: buzz_count, fizzbuzz: fizzbuzz_count }
  end

  rand_nums = (1..100).to_a

  10.times do
    array_size = (1..10).to_a.sample
    random_array = []
    array_size.times { random_array << rand_nums.sample }

    context "for the array: #{random_array}" do
      it "should produce the correct output" do
        expect(fizzbuzz_counter(random_array)).to eql determine_answer(random_array)
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
