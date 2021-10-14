require "bike.rb"

describe Bike do
  bike_instance = Bike.new

  it 'checks that bike instance responds to working method' do
    expect(bike_instance.respond_to?(:working?)).to eq(true)
  end 

  it 'reports bike is broken'do 
  subject.broken
  expect(subject.working?).to eq false 
end 
end