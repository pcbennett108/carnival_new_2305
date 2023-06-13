require './lib/visitor'
require './lib/ride'
require './lib/carnival'


RSpec.describe Carnival do 
  before(:each) do
    @carnival1 = Carnival.new(9)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

  end

  it "exists" do
    expect(@carnival).to be_instance_of(Carnival)
  end

  it "has attributes" do
    expect(@carnival1.duration).to eq(9)
    expect(@carnival1.rides).to eq([])
  end
  
  it "can add rides" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    expect(@carnival1.rides).to eq([@ride1, @ride2, @ride3])
  end
  

end
