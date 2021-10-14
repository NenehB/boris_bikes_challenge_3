require_relative 'bike'
class DockingStation
  attr_reader :bikes

  def initialize ()
    @bikes = []

  end

  def release_bike
   p @bikes 
   fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def return_bike(bike)
    fail 'Bikes at maximum capacity' if @bikes.count >= 20
    @bikes << bike
  end

  #def bike
    #return @bike
  #end
end
