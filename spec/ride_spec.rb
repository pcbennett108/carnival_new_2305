require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do 
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
  end

  it "exists" do
    expect(@ride1).to be_instance_of(Ride)
  end

  it "has attributes" do
    expect(@ride1.name).to eq("Carousel")
    expect(@ride1.min_height).to eq(24)
    expect(@ride1.admission_fee).to eq(1)
    expect(@ride1.excitement).to eq(:gentle)
    expect(@ride1.total_revenue).to eq(0)
    
  end
  
  it "can board riders and keep a log of rides per person" do
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
  end
  
  xit "can check tall enough to ride" do
    expect(@visitor1.tall_enough?(54)).to be true
    expect(@visitor2.tall_enough?(54)).to be false
    expect(@visitor3.tall_enough?(54)).to be true
    expect(@visitor1.tall_enough?(64)).to be false
  end

end



# pry(main)> visitor1.spending_money
# #=> 8

# pry(main)> visitor2.spending_money
# #=> 4

# pry(main)> ride1.total_revenue
# #=> 3

# pry(main)> visitor3 = Visitor.new('Penny', 64, '$15')
# #=> #<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[], @spending_money=15>

# pry(main)> ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
# #=> #<Ride:0x0000000159a0cd00 @admission_fee=5, @excitement=:gentle, @min_height=36, @name="Ferris Wheel", @rider_log={}>

# pry(main)> ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
# #=> #<Ride:0x0000000159ae7a68 @admission_fee=2, @excitement=:thrilling, @min_height=54, @name="Roller Coaster", @rider_log={}>

# pry(main)> visitor2.add_preference(:thrilling)
# #=> [:gentle, :thrilling]

# pry(main)> visitor3.add_preference(:thrilling)
# #=> [:thrilling]

# pry(main)> ride3.board_rider(visitor1)

# pry(main)> ride3.board_rider(visitor2)

# pry(main)> ride3.board_rider(visitor3)

# pry(main)> visitor1.spending_money
# #=> 8

# pry(main)> visitor2.spending_money
# #=> 4

# pry(main)> visitor3.spending_money
# #=> 13

# pry(main)> ride3.rider_log
# #=> {#<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[:thrilling], @spending_money=13>=>1}

# pry(main)> ride3.total_revenue
# #=> 2