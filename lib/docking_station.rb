require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :all_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @all_bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking station full' if full?
    all_bikes << bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike broken!' if all_bikes[-1].broken?
    all_bikes.pop
  end

private

  def full?
    all_bikes.count >= capacity
  end

  def empty?
    all_bikes.empty?
  end

end
