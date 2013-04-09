# coding: utf-8
class Sprint < ActiveRecord::Base
  attr_accessible :date_begin, :date_end, :fact_points, :hours_count, :name, :points, :status, :unknown_level

  validates :name, presence: true, length: { maximum: 50 }
  validates :points, numericality: { greater_than_or_equal_to: 0  }
  validates :unknown_level, numericality: { greater_than_or_equal_to: 0 }
  validates :fact_points, numericality: { greater_than_or_equal_to: 0 }
  validates :hours_count, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true  
  
  validate :date_begin_less_then_date_end
  def date_begin_less_then_date_end
  	errors.add(:Дата_начала, "не может быть больше даты окончания") if 
  		!date_begin.blank? and !date_end.blank? and date_begin > date_end
  end
end
