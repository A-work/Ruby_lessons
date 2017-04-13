#
# Класс Station (Станция).
#
class Station

  attr_reader :trains

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def self.all
    @@stations
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select {|train| type == train.class::TYPE}
  end

  def remove_train(train)
    @trains.delete(train)
  end
  
end