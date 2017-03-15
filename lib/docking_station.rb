require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Dock Full' if full?
    bikes << (bike)
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end

private

  def full?
    bikes.count > capacity
  end

  def empty?
    bikes.empty?
  end

end
