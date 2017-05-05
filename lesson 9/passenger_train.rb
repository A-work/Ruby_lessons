require_relative('validation')
require_relative('train')

class PassengerTrain < Train

  private

  def valid_car_type?(car)
    car.class == PassengerCar
  end
end