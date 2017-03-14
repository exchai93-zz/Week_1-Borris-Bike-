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

  # it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  # it { is_expected.to respond_to(:bike) }
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)

    expect(subject.bike).to eq bike
  end

  #docking stations not to release bikes when there are none
  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'Full' do
    subject.dock(Bike.new)
    expect { subject.dock Bike.new }.to raise_error 'Dock Full'
  end

end
