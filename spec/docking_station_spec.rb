require 'docking_station'
require 'bike'

describe DockingStation do

  it 'returns bike when released' do
    expect(subject).to respond_to :release_bike
  end


  describe '#release_bike' do # this tests to see if the bike is being released
    it 'releases a working bike' do
      bmx = Bike.new # makes a new instance bmx of the bike class - object
      subject.dock(bmx) # docking the bmx in the docking station using the dock method
      released_bike = subject.release_bike # using the release bike method on docking station
      expect(released_bike).to be_working
    end
  end

  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end


  describe '#dock' do
    it 'docks a bike' do
      bmx = Bike.new
      expect(subject.dock(bmx)).to eq [bmx]
    end
    it 'raises an error when full' do
    subject.capacity.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error('Docking station full')
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
      subject {DockingStation.new}
      let(:bike) { Bike.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect {subject.dock(bike)}.to raise_error 'Docking station full'
      end
    end
end
