require 'rspec'
require './lib/attendee'

describe Attendee do
  describe '#new' do
    it 'creates a new instance' do
      attendee = Attendee.new('Bob Ross', 20)
      expect(attendee).to be_instance_of Attendee
    end

    it 'has a name' do
      attendee = Attendee.new('Bob Ross', 20)
      expect(attendee.name).to eq 'Bob Ross'
    end

    it 'has money to spend' do
      attendee = Attendee.new('Bob Ross', 20)
      expect(attendee.spending_money).to eq 20
    end

    it 'has interests' do
      attendee = Attendee.new('Bob Ross', 20)
      expect(attendee.interests).to be_instance_of Array
      expect(attendee.interests).to eq []
    end
  end

  describe '#add_interest' do
    it 'adds a new interest to the attendee' do
      attendee = Attendee.new('Bob Ross', 20)
      attendee.add_interest('Bumper Cars')
      attendee.add_interest('Ferris Wheel')
      expected_interests = ['Bumper Cars', 'Ferris Wheel']
      expect(attendee.interests).to eq expected_interests
    end
  end
end
