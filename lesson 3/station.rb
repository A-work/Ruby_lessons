#
# Класс Station (Станция).
#
class Station
 
  attr_reader :name
 
  def initialize(name)
    @name = name
    @trains = []
  end
 
  def take_train(train)
    @trains << train
  end
 
  def show_trains(train_type)
    @trains.select { |train| train.type == train_type }
  end
 
  def send_train(train)
    @trains.delete(train)
  end
 
end