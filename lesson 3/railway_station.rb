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
  attr_reader :type, :number, :cars
  attr_accessor :speed, :route

  def initialize(number,type,cars)
    @number = number
    @type = type
    @cars = cars
    @speed = 0
    @index = 0
  end

  def stop
    @speed = 0
  end

  def add_car
    @cars += 1 if stopped?
  end

  def remove_car
    return if @cars == 0
    @cars -= 1 if stopped?
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

train = Train.new("788","passenger",5)

station_alabinskaja = Station.new("alabinskaja")
station_rossijskaja = Station.new("rossijskaja")
station_moskovskaja = Station.new("moskovskaja")
station_gagarinskaja = Station.new("gagarinskaja")

route = Route.new(station_alabinskaja,station_rossijskaja)


station_alabinskaja.add_train(train) # станция может принимать поезда
puts station_alabinskaja.trains.inspect # показать все поезда на станции в текущий момент
puts station_alabinskaja.trains_by_type("passenger").inspect #может показывать список поездов на станции по типу, >>
puts station_alabinskaja.trains_by_type("passenger").count # и их количеству.
station_alabinskaja.remove_train(train) # может отправлять поезда

route.add_station(station_moskovskaja) # маршрут может добавлять промежуточные станции
route.add_station(station_gagarinskaja) # добавляет также станцию
route.remove_station(station_moskovskaja) # может удалять промежуточные станции
puts route.stations.inspect # вывести список всех станций от начала до конечной

train.speed = 100 # может набирать скорость
puts train.speed # может показывать текущую скорость
puts train.stop # может сбрасывать скорость до 0
puts train.cars # может показать количество вагонов
train.add_car # может добавлять вагон
train.remove_car # может отцеплять вагон

train.route = route # может принимать маршрут
train.forward # может перемещаться на станцию вперед
train.backward # может перемещаться на станцию назад

puts train.current_station # может показывать текущую станцию
puts train.prev_station # может показывать предыдущую станцию
puts train.next_station # может показать следующую станцию

# номер пассажирского поезда - 788, высокоскоростной
