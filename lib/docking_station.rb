require_relative 'bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike 
    fail 'No bikes available' if empty?
    @bikes.each do |bike|
      if bike.working?
        return bike
      end
    end 

  end

  def return_bike(bike)
    fail 'Bikes at maximum capacity' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    all_working_bike = 0 
    @bikes.each do |bike|
      if bike.working? 
        all_working_bike += 1 
      end 
    end 
    if all_working_bike == 0
      true
    else
      false
    end 
  end

end
