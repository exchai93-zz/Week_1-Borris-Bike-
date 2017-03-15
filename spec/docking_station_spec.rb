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
    expect(subject.instance_variable_get(:@bikes)).to include(bike)
  end

  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises an error when full' do
    20.times {subject.dock Bike.new}
      expect {subject.dock Bike.new }.to raise_error 'Dock Full'
  end

end
