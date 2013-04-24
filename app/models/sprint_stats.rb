class SprintStats < ActiveRecord::Base
  attr_accessible :velocity, :points

  validates :velocity, :points, numericality: { greater_then_or_equal_to: 0 }
  
  def self.update_stats
    fact_points = 0
    hours = 0
    velocity = 0
    probable_points = 0
    
    stat = SprintStats.get_first
    sprints_with_hours = Sprint.with_hours
    sprints_with_hours.each do |swh|
      fact_points += swh.fact_points
      hours += swh.hours_count      
    end
    
    if hours > 0
      velocity = (fact_points / hours).round(2)
    end
    stat.velocity = velocity
    if sprints_with_hours.count > 0
      probable_points = (velocity * hours / sprints_with_hours.count).round(2)
    end    
    stat.points = probable_points
    stat.save
  end

  
  def self.get_first
    if SprintStats.count == 0
      SprintStats.create(velocity: 0, points: 0)
    else
      SprintStats.first
    end
  end

end
