#
# Класс Train (Поезд).
#
class Train
 
  attr_reader :carriage_amount, :speed
  attr_accessor :route
 
  def initialize(number, type, carriage_amount)
    @number = number
    @type = type
    @carriage_amount = carriage_amount
    @speed = 0
    @current_station_id = 0
  end
 
  def stop
    @speed = 0
  end
 
  private def stopped?
    @speed == 0
  end
 
  def speedup(speed)
    @speed += speed
  end
 
  def slowdown(speed)
    if @speed - speed >= 0
      @speed -= speed
    else
      @speed = 0
    end
  end
 
  def carriage_add
    @carriage_amount += 1 if stopped?
  end
 
  def carriage_remove
    @carriage_amount -= 1 if stopped? && @carriage_amount > 0
  end
 
  def show_current_station
    puts "Текущая станция #{@route.stations[@current_station_id].name}"
  end
 
  def show_next_station
    puts "Следующая станция #{@route.stations[@current_station_id + 1].name}"
  end
 
  def show_previous_station
    if @current_station_id != 0
      puts "Предидущая станция #{@route.stations[@current_station_id - 1].name}"
    else
      puts "Поезд на начальной станции"
    end
  end
 
  def goto_station(station)
    @current_station_id = @route.stations.index(station)
  end
end