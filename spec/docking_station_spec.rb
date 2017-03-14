require 'docking_station'

describe DockingStation do
  it 'returns bike when released' do
    expect(subject).to respond_to :release_bike
  end
end
