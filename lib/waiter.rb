require 'pry'
class Waiter
  attr_reader :name, :age
  attr_accessor :meals
  @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    @meals = []
    @@all << self
  end
  def new_meal(new_customer, total, tip)
    @meals << new_customer.new_meal(self, total, tip)
  end
  def best_tipper
    @meals.max{ |c1,c2| c1.tip <=> c2.tip }.customer
  end
  class << self
    def all
      @@all
    end
  end
end