class Ride
  attr_reader :name, :cost
  def initialize(attrs)
    @name = attrs[:name]
    @cost = attrs[:cost]
  end
end
