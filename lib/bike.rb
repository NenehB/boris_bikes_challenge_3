class Bike
  def initialize
    @working_bike = true 
  end 
  def working?
    @working_bike
  end 
  def broken
    @working_bike = false 
  end 
end 
