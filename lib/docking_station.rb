require_relative 'bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize ()
    @bikes = []

  end

  def release_bike 
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def return_bike(bike)
    fail 'Bikes at maximum capacity' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
