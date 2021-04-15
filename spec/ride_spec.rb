require 'rspec'
require './lib/ride'

describe Ride do
  describe '#new' do
    it 'creates a new Ride instance' do
      ride = Ride.new({name: 'Ferris Wheel', cost: 0})
      expect(ride).to be_instance_of Ride
    end

    it 'has a name' do
      ride = Ride.new({name: 'Ferris Wheel', cost: 0})
      expect(ride.name).to eq 'Ferris Wheel'
    end
  end
end
