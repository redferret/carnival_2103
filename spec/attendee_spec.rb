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
  end
end
