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
    return unless @stations.include?(station)
    @stations.delete(station) if station != @stations[0] && station != @stations[-1]
  end

end