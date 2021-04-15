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
end
