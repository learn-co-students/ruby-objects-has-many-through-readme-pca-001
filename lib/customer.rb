class Customer
  attr_reader :name, :age, :meals, :waiters
  @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    @meals = []
    @waiters = []
    @@all << self
  end
  def new_meal(new_waiter, total, tip)
    meal = Meal.new(new_waiter, self, total, tip)
    @meals << meal
    new_waiter.meals << meal
    @waiters << new_waiter
    meal
  end
  class << self
    def all
      @@all
    end
  end
end