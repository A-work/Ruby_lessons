require_relative('station')
require_relative('route')
require_relative('train')
require_relative('passenger_train')
require_relative('cargo_train')
require_relative('cargo_car')
require_relative('passenger_car')
require_relative('storage')

class MyProgram
  COMMANDS = %w(
    create_station create_train create_route
    edit_route  assign_route
    add_car remove_car
    forward backward all_stations trains_of_station stop
    create_car cars_of_train fill_car
  ).freeze

  def initialize
    @storage = Storage.new
  end

  def create_station
    puts 'Введите название станции: '
    name_of_station = gets.chomp
    @storage.save_station(name_of_station)
    all_stations
  end

  def create_train
    puts 'Введите номер поезда: '
    number = gets.chomp
    puts 'Введите тип поезда грузовой или пассажирский (Cargo/Passenger): '
    type = gets.chomp
    @storage.save_train(number, type)
    trains
  end

  def create_route
    all_stations
    puts 'Напишите номер начальной станции из своего списка'
    start_station = @storage.stations[gets.chomp.to_i-1]
    puts 'Сделайте то же самое, что и выше для конечной станции'
    end_station = @storage.stations[gets.chomp.to_i-1]
    @storage.save_route(start_station, end_station)
    routes
  end

  def edit_route
    routes
    puts 'Введите номер своего маршрута из списка: '
    route = @storage.routes[gets.chomp.to_i-1]
    all_stations
    puts 'Выберите номер своей станции: '
    station = @storage.stations[gets.chomp.to_i-1]
    puts 'Выберите действие удалить или добавить (remove/add): '
    action = gets.chomp
    @storage.update_route(route, station, action)
    puts route
  end

  def assign_route
    trains
    puts 'Введите номер своего поезда из списка: '
    train = @storage.trains[gets.chomp.to_i-1]
    routes
    puts 'Введите номер своего маршрута из списка: '
    route = @storage.routes[gets.chomp.to_i-1]
    @storage.assign_route(train, route)
    route.stations[0].trains << train
    current_train(train)
  end

  def add_car
    trains
    puts 'Введите номер своего поезда из списка: '
    train = @storage.trains[gets.chomp.to_i-1]
    cars
    puts 'Введите номер вагона из своего списка: '
    car = @storage.cars[gets.chomp.to_i-1]
    train.add_car(car)
    current_train(train)
  end

  def remove_car
    trains
    puts 'Введите номер своего поезда из списка: '
    train = @storage.trains[gets.chomp.to_i-1]
    cars
    puts 'Выберите номер вагона для удаления: '
    car = gets.chomp.to_i-1
    train.cars.delete_at(car)
    current_train(train)
  end

  def forward
    trains
    puts 'Введите номер своего поезда из списка: '
    train = @storage.trains[gets.chomp.to_i-1]
    train.forward
    @storage.move_train(train)
    current_train(train)
  end

  def backward
    trains
    puts 'Введите номер своего поезда из списка: '
    train = @storage.trains[gets.chomp.to_i-1]
    train.backward
    @storage.move_train(train)
    current_train(train)
  end

  def all_stations
    puts @storage.stations.inspect
  end

  def trains_of_station
    all_stations
    puts 'Выберите номер своей станции: '
    station = @storage.stations[gets.chomp.to_i-1]
    station.each_train {|train| puts train.inspect}
  end

  def create_car
    puts 'Введите тип вагона (Cargo/Passenger): '
    type = gets.chomp
    puts 'Выберите место или несколько (в цифрах): '
    car = CargoCar.new(val) if type == 'Cargo'
    car = PassengerCar.new(val) if type == 'Passenger'
    @storage.save_car(car)
    cars
  end

  def cars_of_train
    trains
    puts 'Введите номер своего поезда из списка: '
    train = @storage.trains[gets.chomp.to_i-1]
    train.each_car {|car| puts car.inspect}
  end

  def fill_car
    cars
    puts 'Введите номер вагона: '
    car = @storage.cars[gets.chomp.to_i-1]
    if car.class == CargoCar
      puts'Сколько вы хотите заполнить (в цифрах)?: '
      number = gets.chomp.to_i
      car.fill_amount(number)
    else
      car.take_place
    end
    puts car.inspect
  end

  def welcome
    puts 'Привет!'
    puts '<' * 80
    puts '>' * 80
    puts 'Сохраняйте спокойствие и выберете нужный метод. Чтобы выйти, напишите stop и нажмите Enter.'
    puts 'Например: create_train '
    puts '>' * 80
  end

  private

  def current_train(train)
    puts train.inspect
  end

  def routes
    puts @storage.routes.inspect
  end

  def trains
    puts @storage.trains.inspect
  end

  def cars
    puts @storage.cars.inspect
  end
end

program = MyProgram.new
program.welcome

MyProgram::COMMANDS.each_with_index {|c,i| puts "#{i+1}. #{c}"}

while true
  command = gets.chomp

  until MyProgram::COMMANDS.include?(command)
    puts 'Ошибка!!! Попробуйте еще раз.'
    command = gets.chomp
  end

  break if command == 'stop'

  program.send(command)

  puts '$' * 80
  puts 'Выберете метод для остановки (stop).'
  puts '$' * 80
end