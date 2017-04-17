#
# Класс Station (Станция).
#
class Station

  attr_reader :trains

  @@stations = []

  def initialize(name)
    @name = name
    validate!
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
    types = {
        cargo: 'CargoTrain',
        passenger: 'PassengerTrain'
    }
    @trains.select {|train| types[type.to_sym] == train.class.to_s}
  end

  def remove_train(train)
    @trains.delete(train)
  end

  private

  def validate!
    raise "Не может быть пустым" if @name.to_s.empty?
    true
  end
end