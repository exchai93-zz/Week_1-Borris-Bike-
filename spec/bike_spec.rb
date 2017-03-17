require 'bike'

describe Bike do
  # tests if bike is working
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :broken? }

  it 'reports when bike is broken' do
    subject.report_broken
    expect(subject).to be_broken
  end
end
