class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def sorted_missions
    missions.map {|mission| mission.title}.sort
  end

  def total_time_in_space
    missions.sum {|mission| mission.time_in_space}
  end
end
