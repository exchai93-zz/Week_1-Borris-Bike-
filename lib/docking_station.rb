require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @all_bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @all_bikes << (bike)
    end
  end

  def release_bike
    fail 'No bikes available' if empty?
    @all_bikes.pop
    end
  end

private

  attr_reader :all_bikes

  def full?
    @all_bikes.count > capacity
  end

  def empty?
    @all_bikes.empty?
  end

end
