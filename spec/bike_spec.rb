require 'bike'

describe Bike do
  # tests if bike is working
  it { is_expected.to respond_to :working? }

end
