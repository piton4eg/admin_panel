# coding: utf-8
class Sprint < ActiveRecord::Base
  attr_accessible :date_begin, :date_end, :fact_points, :hours_count, :name, :points, :status, :unknown_level

  validates :name, presence: true, length: { maximum: 50 }
  validates :points, :unknown_level, :fact_points, :hours_count, numericality: { greater_than_or_equal_to: 0  }
  validates :status, :date_begin, :date_end, presence: true
  
  validate :date_begin_less_then_date_end
  def date_begin_less_then_date_end
  	errors.add(:Дата_начала, "не может быть больше даты окончания") if 
  		!date_begin.blank? and !date_end.blank? and date_begin > date_end
  end

  scope :with_hours, where("hours_count > '0' AND status <> 'Планируемый'")  

  after_save -> { SprintStats.update_stats }  
  after_destroy -> { SprintStats.update_stats }

  def self.where_id(id)
    where(id: id).first
  end
end