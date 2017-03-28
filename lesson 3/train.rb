#
# Класс Train (Поезд).
#
class Train
 
  attr_reader    :number, :type, :speed, :carriage_amount, :current_route
 
  def initialize(number, type, carriage_amount)
    @number = number
    @type = type
    @carriage_amount = carriage_amount
    @speed = 0
    @current_station_id = 0
  end
 
  def gain_speed
    @speed += 10
  end
 
  def stop
    @speed = 0
  end
 
  def carriage_add
    @carriage_amount += 1 if stopped?
  end
 
  def carriage_remove
    @carriage_amount -= 1 if stopped? && @carriage_amount > 0
  end
 
  def get_route=(route)
    @route = route.stations
  end
 
  def forward
    unless current_route == last_route
      leave
      @current_station_id += 1
      go_to_station
    end
  end
 
  def backward
    unless current_route == first_route
      leave
      @current_station_id -= 1
      go_to_station
    end
  end
 
  def current_route
    @route[@current_station_id]
  end
 
  def next_station
    @route[current_station_id + 1] if current_route != last_route
  end
 
  def prev_station
    @route[current_station_id - 1] if current_route != first_route
  end
 
  protected
 
  def first_route
    @route.first
  end
 
  def last_route
    @route.last
  end
 
  def stopped?
    @speed.zero?
  end
 
  def leave
    self.current_route.leave_train(self)
  end
 
  def go_to_station
    self.current_route.take_train(self)
  end
 
end