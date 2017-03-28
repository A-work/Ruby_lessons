#
# Класс Station (Станция).
#
class Station
 
  attr_reader :name, :trains
 
  def initialize(name)
    @name = name
    @trains = []
  end
 
  def take_train(train)
    @trains << train
  end
 
  def show_trains(type)
    @trains.select { |train| train.type == type }
  end
 
  def leave_train(train)
    @trains.delete(train)
  end
 
end