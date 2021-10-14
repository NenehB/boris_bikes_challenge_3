require_relative 'bike'

class DockingStation
  attr_reader :bikes

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
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end

end
