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
    @trains.select {|train| type == train.class::TYPE}
  end

  def remove_train(train)
    @trains.delete(train)
  end
  
end