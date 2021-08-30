class Bird
  attr_reader :name, :age, :origin
  attr_accessor :nickname

  def initialize(name:, age:, origin:, nickname: nil)
    @name = name
    @age = age
    @origin = origin
    @nickname = nickname || name
  end

  def increment_age
    @age += 1
  end
end
