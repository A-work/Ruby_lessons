#
# Класс Train (Поезд).
#
class Train

  attr_reader :number, :cars, :index
  attr_accessor :speed, :route

  def initialize(number)
    @number = number
    @speed = 0
    @cars = []
    @index = 0
  end

  def stop
    @speed = 0
  end

  def forward
    @index += 1 if can_next?
  end

  def backward
    @index -= 1 if @index > 0
  end

  def current_station
    @route.stations[@index]
  end

  def prev_station
    @route.stations[@index-1] if @index > 0
  end

  def next_station
    @route.stations[@index+1] if can_next?
  end

  def stopped?
    @speed == 0
  end

  def can_next?
    @index <= @route.stations.size
  end

  def add_car(car)
    @cars << car if valid_car_type?(car) &&  stopped?
  end

end