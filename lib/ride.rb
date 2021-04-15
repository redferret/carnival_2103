class Ride
  attr_reader :name
  def initialize(attrs)
    @name = attrs[:name]
    @cost = attrs[:cost]
  end
end
