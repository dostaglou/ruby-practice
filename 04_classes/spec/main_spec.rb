# frozen_string_literal: true

require_relative '../lib/main'

describe "Bird" do
  let(:basic_variables) { { name: "Tweety", age: 1, origin: "WB" } }
  let(:basic_bird) { Bird.new(**basic_variables) }

  context "attr reader/writers" do
    it "should have a reader for name but not a writer" do
      expect(basic_bird.respond_to?(:name)).to eql true
      expect(basic_bird.respond_to?(:name=)).to eql false
    end

    it "should have a reader for origin but not a writer" do
      expect(basic_bird.respond_to?(:origin)).to eql true
      expect(basic_bird.respond_to?(:origin=)).to eql false
    end

    it "should have a reader for age but not a writer" do
      expect(basic_bird.respond_to?(:age)).to eql true
      expect(basic_bird.respond_to?(:age=)).to eql false
    end

    it "should have a reader and writer for nickname" do
      expect(basic_bird.respond_to?(:nickname)).to eql true
      expect(basic_bird.respond_to?(:nickname=)).to eql true
      epxect { basic_bird.nickname=("Little Bird") }.to change { basic_bird.nickname }.from("Tweety").to("Little Bird")
    end
  end

  context "#new with initial nickname" do
    it "should allow nickname to be set on initalization" do
      expect(Bird.new(**basic_variables.merge(nickname: "Foghorn Leghorn")).nickname).to eql "Foghorn Leghorn "
    end
  end

  context "#increment_age" do
    it "should have an increment_age method that increments the age precisely 1" do
      expect { basic_bird.increment_age }.to change { basic_bird.age }.from(1).to(2)
    end
  end
end
