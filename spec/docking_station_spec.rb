require "docking_station.rb"

describe DockingStation do
  bike = DockingStation.new
  it 'DockingStation releases bike' do
    expect(bike.respond_to?(:release_bike)).to eq(true)
  end 

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      # Let's not dock a bike first:
      # subject = DockingStation.new
      # bike = Bike.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#return_bike' do
    it 'raises an error when there is already a bike' do
      bike = Bike.new
      subject.return_bike(bike)
      expect{ DockingStation::DEFAULT_CAPACITY.times{subject.return_bike(bike) }}.to raise_error 'Bikes at maximum capacity'
    end
  end

  it 'Release a working bike' do
    # station = DockingStation.new
    bike =  Bike.new
    subject.return_bike(bike)
    expect(bike.working?).to eq(true)
  end

  it 'Returns a bike to the docking station' do
    bike = Bike.new
    subject.return_bike(bike)
    expect(subject.bikes).to eq [bike]
    #station = DockingStation.new
    #expect(station.return_bike(bike)).to eq(bike)
  end
  describe 'release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.return_bike(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end
  
  end
  
  it 'allows us to dock 20 bikes' do
 expect { DockingStation::DEFAULT_CAPACITY.times{subject.return_bike(Bike.new)}}.not_to raise_error
  end

end
