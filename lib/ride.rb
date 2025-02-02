class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log

  def initialize(data)
    @name = data[:name]
    @min_height = data[:min_height]
    @admission_fee = data[:admission_fee]
    @excitement = data[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  def board_rider(rider)
    if rider.tall_enough?(@min_height) &&
      rider.preferences.include?(@excitement)
        collect_fee(rider)
        log_ride(rider)
    end
  end

  def collect_fee(rider)
    rider.buy_ride(@admission_fee)
    @total_revenue += @admission_fee
  end
  
  def log_ride(rider)
    if @rider_log[rider].nil?
        @rider_log[rider] = 1
    else
      @rider_log[rider] += 1
    end
  end



end