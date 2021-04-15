class Attendee
  attr_reader :name, :spending_money, :interests

  def initialize(name, money)
    @name = name
    @spending_money = money
    @interests = []
  end

  def add_interest(interest)
    @interests << interest
  end

  def recommended_rides
    @interests.each_with_object([]) do |ride, my_recommended|
      yield(ride, my_recommended)
    end
  end
end
