#! /usr/bin/env ruby
# Zachary Bochanski
# Decorator Pattern

# This class can not be modified. Pretend it is from a library that is "closed."
class HyperCar

  def initialize(sound)
    @sound = sound
  end

  def go
    3.times { puts @sound }
  end

end

# Do not modify this class. Pretend it is from a library that is "closed."
class Service

  def initialize(thing_that_goes)
    @thing_that_goes = thing_that_goes
  end

  def execute
    @thing_that_goes.go
  end

end

class CarDecorator

  def initialize(hyper_car)
    @hyper_car = hyper_car
  end

  def go
    puts "awooga!"
    @hyper_car.go
    puts "waka waka waka"
  end

end

# Not decorated
puts "first service:"
hyper_car = HyperCar.new("bzzzz")
service = Service.new(hyper_car)
service.execute

# Decorated
puts "second service that decorates the car:"
second_service = Service.new( CarDecorator.new(HyperCar.new("bzzz")) )
second_service.execute
