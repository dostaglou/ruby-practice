# frozen_string_literal: true

require_relative '../lib/main'
require_relative './answers'

describe "#argument_organizer" do
  let(:response) { argument_organizer(*args) }
  let(:answer) { argument_organizer_answer(*args) }

  context "shuffled range from 1 to 100" do
    let(:args) { (1..100).to_a.shuffle }

    it "should return a range 1 to 100 with each being a float" do
      expect(response).to eql answer
    end
  end

  context "when passed some strings of floats ('1.12')" do
    let(:args) { ["1.11", 22.22, 3, "4"]}

    it "should convert strings of floats and sort" do
      expect(response).to eql answer
    end
  end
end

describe "#valid_data_type?" do
  let(:response) { valid_data_type?(**keys) }
  let(:answer) { valid_data_type_answer(**keys) }

  context "passed all values and all are passing true" do
    let(:keys) { {string: ["abc"], float: [1.23], integer: [1] } }

    it "should return true" do
      expect(response).to eql answer
    end
  end

  context "passed no arguments" do
    let(:keys) {{}}

    it "should return true" do
      expect(response).to eql answer
    end
  end

  context "passed an invalid entry for string" do
    let(:keys) {{ string: [nil]}}

    it "should return true" do
      expect(response).to eql answer
    end
  end

  context "passed an invalid entry for float" do
    let(:keys) {{ float: [nil]}}

    it "should return true" do
      expect(response).to eql answer
    end
  end

  context "passed an invalid entry for integer" do
    let(:keys) {{ integer: [nil]}}

    it "should return true" do
      expect(response).to eql answer
    end
  end
end
