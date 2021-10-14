require "docking_station.rb"

describe DockingStation do

  let(:bike) { double :bike }

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
      subject.return_bike(bike)
      expect{ DockingStation::DEFAULT_CAPACITY.times{subject.return_bike(bike) }}.to raise_error 'Bikes at maximum capacity'
    end
  end

  it 'Release a working bike' do
    subject.return_bike(bike)
    allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to eq(true)
  end

  it 'Returns a bike to the docking station' do
    subject.return_bike(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe 'release_bike' do
    it 'releases a bike' do
      subject.return_bike(bike)
      allow(bike).to receive(:working?).and_return(true)
      expect(subject.release_bike).to eq bike
    end
  
  end
  
  it 'allows us to dock 20 bikes' do
    expect { DockingStation::DEFAULT_CAPACITY.times{subject.return_bike(bike)}}.not_to raise_error
  end

  it 'has a variable capacity' do
    station = DockingStation.new(30)
    expect{30.times {station.return_bike(bike)}}.not_to raise_error
  end
   
  it 'should not release broken bikes' do
     broken_bike = bike
     allow(bike).to receive(:broken)
     broken_bike.broken
     subject.return_bike(broken_bike)
     allow(bike).to receive(:working?).and_return(false)
     expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'Dockingstation should accept a bike broken or not'do 
      broken_bike = double(:bike, working?: false)
      working_bike = double(:bike, working?: true)
      subject.return_bike(working_bike)
      subject.return_bike(broken_bike)
      expect(subject.release_bike.working?).to eq true
  end 
end
