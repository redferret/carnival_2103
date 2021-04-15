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
    it 'has attendees' do
      jeffco_fair = Carnival.new('Jefferson County Fair')
      expect(jeffco_fair.attendees).to eq []
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

  describe '#admit' do
    it 'admits attendee' do
      jeffco_fair = Carnival.new("Jefferson County Fair")

      bob = Attendee.new("Bob", 0)
      sally = Attendee.new('Sally', 20)
      johnny = Attendee.new("Johnny", 5)

      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expected_attendees = [bob, sally, johnny]

      expect(jeffco_fair.attendees).to eq expected_attendees
    end
  end

  describe '#attendees_by_ride_interest' do
    it 'returns hash with keys as rides and array of attendees' do
      jeffco_fair = Carnival.new("Jefferson County Fair")
      ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
      bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
      scrambler = Ride.new({name: 'Scrambler', cost: 15})

      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      bob = Attendee.new("Bob", 0)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')

      sally = Attendee.new('Sally', 20)
      sally.add_interest('Bumper Cars')

      johnny = Attendee.new("Johnny", 5)
      johnny.add_interest('Bumper Cars')

      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expected_hash = {
        ferris_wheel => [bob],
        bumper_cars => [bob, sally, johnny],
        scrambler => []
      }

      expect(jeffco_fair.attendees_by_ride_interest).to eq expected_hash
    end
  end

  describe '#ticket_lottery_contestants' do
    it 'returns array of attendess that do not have enough money for a ride(s)' do
      jeffco_fair = Carnival.new("Jefferson County Fair")
      ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
      bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
      scrambler = Ride.new({name: 'Scrambler', cost: 15})

      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      bob = Attendee.new("Bob", 0)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')

      sally = Attendee.new('Sally', 20)
      sally.add_interest('Bumper Cars')

      johnny = Attendee.new("Johnny", 5)
      johnny.add_interest('Bumper Cars')

      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expected_contestants = [bob, johnny]

      expect(jeffco_fair.ticket_lottery_contestants).to eq expected_contestants
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
