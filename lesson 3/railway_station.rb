#
# Класс Station (Станция).
#
class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select {|train| type == train.type}
  end

  def remove_train(train)
    @trains.delete(train)
  end
end

#
# Класс Route (Маршрут).
#
class Route
  attr_reader :stations

  def initialize(start_station,end_station)
    @stations = [start_station,end_station]
  end

  def add_station(station)
    @stations.insert(-2,station)
  end

  def remove_station(station)
    @stations.delete(station) if station != @stations[0] && station != @stations[-1]
  end
end

#
# Класс Train (Поезд).
#
class Train
  attr_reader :type, :number, :wagon
  attr_accessor :speed, :route

  def initialize(number,type,wagon)
    @number = number
    @type = type
    @wagon = wagon
    @speed = 0
    @index = 0
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @wagon += 1 if stopped?
  end

  def remove_wagon
    return if @wagon == 0
    @wagon -= 1 if stopped?
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
end