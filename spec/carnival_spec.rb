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

  describe '#recommend_rides' do
    it 'returns of recommended rides' do
      jeffco_fair = Carnival.new('Jefferson County Fair')

      bob = instance_double('Attendee', name: 'Bob')
      sally = instance_double('Attendee', name: 'Sally')

      bobs_recommended = []
      sallys_recommended = []

      allow(bob).to receive(:recommended_rides).and_yield('Bumper Cars', bobs_recommended).and_yield('Ferris Wheel', bobs_recommended)
      allow(sally).to receive(:recommended_rides).and_yield('The Free Faller', sallys_recommended)

      ferris_wheel = instance_double('Ride', name: 'Ferris Wheel')
      bumper_cars = instance_double('Ride', name: 'Bumper Cars')
      the_free_faller = instance_double('Ride', name: 'The Free Faller')

      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(the_free_faller)

      expected_rides_for_bob = [bumper_cars, ferris_wheel]
      expected_rides_for_sally = [the_free_faller]

      actual_rides_for_bob = jeffco_fair.recommend_rides(bob)
      actual_rides_for_sally = jeffco_fair.recommend_rides(sally)

      expect(actual_rides_for_bob).to eq expected_rides_for_bob
      expect(actual_rides_for_sally).to eq expected_rides_for_sally
    end
  end
end
