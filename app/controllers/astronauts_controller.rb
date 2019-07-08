class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    total_age = @astronauts.sum {|astronaut| astronaut.age}
    @average_age = total_age / @astronauts.count
  end
end
