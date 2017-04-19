require_relative('car')

class PassengerCar < Car
  attr_reader :taken_places

  def initialize(all_places)
    @all_places = all_places
    @taken_places = 0
  end

  def take_place
    @taken_places += 1
  end

  def liberal_places
    @all_places - @taken_places
  end
end