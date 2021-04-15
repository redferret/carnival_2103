class Carnival
  attr_reader :name, :rides, :attendees

  def initialize(name)
    @name = name
    @rides = []
    @attendees = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def admit(attendee)
    @attendees << attendee
  end

  def recommend_rides(attendee)
    attendee.recommended_rides do |interested_ride, recommended|
      recommended << @rides.find do |ride|
        interested_ride == ride.name
      end
    end
  end
end
