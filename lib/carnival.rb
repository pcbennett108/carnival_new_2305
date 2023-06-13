require './lib/visitor'
require './lib/ride'

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
    most_popular_ride = Hash.new(0)
    @rides.each do |ride|
      current_ride_value = ride.rider_log.values.sum
      most_popular_ride[ride] = current_ride_value
    end
    most_popular = most_popular_ride.max_by {|ride, value| value}
    most_popular.first
  end

  def total_revenue
    total_revenue = 0
    @rides.each do |ride|
      total_revenue += ride.total_revenue
    end
    total_revenue
  end

end


# carnival1 = Carnival.new("Funzday", 9)
# ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
# ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
# ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
# visitor1 = Visitor.new('Bruce', 54, '$10')
# visitor2 = Visitor.new('Tucker', 36, '$5')
# visitor3 = Visitor.new('Penny', 64, '$15')

# carnival1.add_ride(ride1)
# carnival1.add_ride(ride2)
# carnival1.add_ride(ride3)
# visitor1.add_preference(:gentle)
# visitor2.add_preference(:gentle)
# visitor2.add_preference(:thrilling)
# visitor3.add_preference(:thrilling)
# ride1.board_rider(visitor1)
# ride1.board_rider(visitor2)
# ride1.board_rider(visitor1)
# ride2.board_rider(visitor1)
# ride2.board_rider(visitor2)
# ride3.board_rider(visitor1)
# ride3.board_rider(visitor2)
# ride3.board_rider(visitor3)

# carnival1.most_popular_ride