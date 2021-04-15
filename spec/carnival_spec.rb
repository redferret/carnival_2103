require 'rspec'
require './lib/carnival'

describe Carnival do
  describe '#new' do
    it 'creates a new instance' do
      jeffco_fair = Carnival.new('Jefferson County Fair')
      expect(jeffco_fair).to be_instance_of Carnival
    end
    it 'has a name' do
      jeffco_fair = Carnival.new('Jefferson County Fair')
      expect(jeffco_fair.name).to eq 'Jefferson County Fair'
    end
    it 'has rides' do
      jeffco_fair = Carnival.new('Jefferson County Fair')
      expect(jeffco_fair.rides).to be_instance_of Array
      expect(jeffco_fair.rides).to eq []
    end
  end

  describe '#add_ride' do
    it 'adds rides to the carnival' do
      jeffco_fair = Carnival.new('Jefferson County Fair')
      mock_ride1 = instance_double('Ride', name: 'Ferris Wheel')
      mock_ride2 = instance_double('Ride', name: 'Bumper Cars')

      jeffco_fair.add_ride(mock_ride1)
      jeffco_fair.add_ride(mock_ride2)

      expected_rides = [mock_ride1, mock_ride2]
      expect(jeffco_fair.rides).to eq expected_rides
    end
  end
end
