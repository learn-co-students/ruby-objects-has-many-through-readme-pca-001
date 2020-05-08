# ./lib/waiter.rb
class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end


  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self #checking for waiter now
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

  def most_frequent
    result = Customer.all.map do |customer|
      count = customer.meals.count { |meal| meal.waiter == self}
      {customer: customer, count: count}
    end.sort {|(cust1, count1),(cust2, count2)| count1 <=> count2}[0]
  end
end
