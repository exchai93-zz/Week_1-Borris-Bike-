require_relative 'bike'

class DockingStation

  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail 'Dock Full' if full?
    @bikes << (bike)
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
