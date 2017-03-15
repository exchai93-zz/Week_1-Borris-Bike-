require 'docking_station'

describe DockingStation do

  it 'returns bike when released' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'docks a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end

  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises an error when full' do
    21.times {subject.dock Bike.new}
    expect {subject.dock Bike.new }.to raise_error 'Dock Full'
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

describe 'initialization' do
  it 'has a capacity of that specified by the user' do
    station = DockingStation.new(50)
    51.times {station.dock Bike.new }
    expect {station.dock Bike.new}.to raise_error 'Dock Full'
  end
end

end
