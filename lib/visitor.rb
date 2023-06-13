class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences
  def initialize(name, height, money)
    @name = name
    @height = height
    @spending_money = money.delete("^0-9").to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(requirement)
    @height >= requirement ? true : false
  end
end