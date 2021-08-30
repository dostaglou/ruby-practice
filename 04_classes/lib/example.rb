class Worker
  attr_reader :birthday
  attr_writer :salary
  attr_accessor :manager

  def initialize(name:, birthday:, salary:, manager: "Sato")
    @name = name
    @birthday = birthday
    @salary = salary
    @manager = manager
  end

  def name
    @name
  end

  def name=(val)
    @name = val
  end

  def give_a_raise
    @salary = (@salary * 1.01).round
  end
end

class Engineer < Worker
  def initialize(**kwargs)
    manager = kwargs[:manager] || "Kevin"
    super(**kwargs.merge(manager: manager))
  end
end

mori = Worker.new(name: "Mori", birthday: "April?", salary: 1_000)
dillon = Engineer.new(name: "Dillon", birthday: "September 20th", salary: 100)
