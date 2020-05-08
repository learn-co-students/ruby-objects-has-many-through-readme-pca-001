class Meal
  attr_reader :waiter, :customer, :total, :tip
  @@all = []
  def initialize(waiter, customer, total, tip)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end
  class << self
    def all
      @@all
    end
  end
end