class Sprint < ActiveRecord::Base
  attr_accessible :date_begin, :date_end, :fact_points, :hours_count, :name, :points, :status, :unknown_level

  validates :name, presence: true, length: { maximum: 50 }
  validates :date_begin, presence: true
  validates :date_end, presence: true
  validates :fact_points, presence: true
  validates :hours_count, presence: true
  validates :points, presence: true
  validates :status, presence: true
  validates :unknown_level, presence: true

end
