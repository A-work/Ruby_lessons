#
# Класс Station (Станция).
#
require_relative('validation')

class Station
  include Validation

  attr_reader :trains

  validate :name, :presence

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

  def each_train
    @trains.each do |train|
      yield(train)
    end
  end
end