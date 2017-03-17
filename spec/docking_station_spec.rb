require 'docking_station'
require 'bike'

describe DockingStation do

  it 'returns bike when released' do
    expect(subject).to respond_to :release_bike
  end

  it 'docks a bike' do
    bmx = Bike.new
    subject.dock(bmx)
    expect(subject.bike).to include(bmx)
  end

  describe '#release_bike' do # this tests to see if the bike is being released
    it 'releases a working bike' do
      bmx = Bike.new # makes a new instance bmx of the bike class - object
      subject.dock(bmx) # docking the bmx in the docking station using the dock method
      released_bike = subject.release_bike # using the release bike method on docking station
      expect(released_bike).to be working
    end

  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end
end

  describe '#dock' do
  it 'raises an error when full' do
  subject.capacity.times { subject.dock Bike.new }
  expect { subject.dock Bike.new }.to raise_error 'Docking station full'
  end
end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

# test for broken bikes
  it 'reports the bike if broken' do
    expect(subject.bikes).
  end

#describe 'initialization' do
#  it 'has a capacity of that specified by the user' do
#    station = DockingStation.new(50)
#    51.times {station.dock Bike.new }
#    expect {station.dock Bike.new}.to raise_error 'Dock Full'
#  end
#end

end
