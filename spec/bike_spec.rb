require 'bike'

describe Bike do
  # tests if bike is working
  it { is_expected.to respond_to :working? }
  # tests if bike is docked
  it { is_expected.to respond_to :docked? }
end
