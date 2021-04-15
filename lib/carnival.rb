class Carnival
  attr_reader :name, :rides

  def initialize(name)
    @name = name
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommend_rides(attendee)
    attendee.interests.each_with_object([]) do |interest, recommended|
      recommended << @rides.find do |ride|
        interest == ride.name
      end
    end
  end
end
