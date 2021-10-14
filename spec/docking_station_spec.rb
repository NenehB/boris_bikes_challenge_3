require "docking_station.rb"

describe DockingStation do

  it 'DockingStation releases bike' do
    expect(subject.respond_to?(:release_bike)).to eq(true)
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
      bike = double(:bike)
      subject.return_bike(bike)
      expect{ DockingStation::DEFAULT_CAPACITY.times{subject.return_bike(bike) }}.to raise_error 'Bikes at maximum capacity'
    end
  end

  it 'Release a working bike' do
    bike =  double(:bike)
    subject.return_bike(bike)
    expect(bike.working?).to eq(true)
  end

  it 'Returns a bike to the docking station' do
    bike = double(:bike)
    subject.return_bike(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe 'release_bike' do
    it 'releases a bike' do
      bike = double(:bike)
      subject.return_bike(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end
  
  end
  
  it 'allows us to dock 20 bikes' do
    expect { DockingStation::DEFAULT_CAPACITY.times{subject.return_bike(double(:bike))}}.not_to raise_error
  end

  it 'has a variable capacity' do
    station = DockingStation.new(30)
    expect{30.times {station.return_bike(double(:bike))}}.not_to raise_error
  end
   
  it 'should not release broken bikes' do
     broken_bike = double(:bike)
     broken_bike.broken
     subject.return_bike(broken_bike)
     expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'Dockingstation should accept a bike broken or not'do 
      broken_bike = double(:bike)
      broken_bike.broken
      working_bike = double(:bike)
      subject.return_bike(working_bike)
      subject.return_bike(broken_bike)
      expect(subject.release_bike.working?).to eq true
  end 
end
