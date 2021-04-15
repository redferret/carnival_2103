require 'rspec'
require './lib/carnival'

describe Carnival do
  describe '#new' do
    it 'creates a new instance' do
      jeffco_fair = Carnival.new("Jefferson County Fair")
      expect(jeffco_fair).to be_instance_of Carnival
    end
  end
end
