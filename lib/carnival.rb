class Carnival
  attr_reader :name,
              :duration,
              :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride

    @rides.each do |ride|

      ride.rider_log.values.sum
    end
  end

  def total_revenue
    total_revenue = 0
    @rides.each do |ride|
      total_revenue += ride.total_revenue
    end
    total_revenue
  end

end