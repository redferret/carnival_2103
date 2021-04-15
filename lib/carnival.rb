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

  def ticket_lottery_contestants(lottery_ride)
    @attendees.find_all do |attendee|
      desired_rides = recommend_rides(attendee)
      cant_afford = desired_rides.find_all do |ride|
        ride if attendee.spending_money < lottery_ride.cost
      end
      attendee if cant_afford.include?(lottery_ride)
    end
  end

  def attendees_by_ride_interest
    @rides.each_with_object({}) do |ride, hash|
      attendees = @attendees.find_all do |attendee|
        attendee.interests.include?(ride.name)
      end
      hash[ride] = attendees
    end
  end

  def recommend_rides(attendee)
    attendee.recommended_rides do |interested_ride, recommended|
      recommended << @rides.find do |ride|
        interested_ride == ride.name
      end
    end
  end
end
