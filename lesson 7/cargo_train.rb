class CargoTrain < Train

  private

  def valid_car_type?(car)
    car.class == CargoCar
  end
end