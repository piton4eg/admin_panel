# coding: utf-8
class ChangeSprintColumns < ActiveRecord::Migration
  def up
    change_table :sprints do |t|
      t.change :name, :string, default: "Наименование", null: false
      t.change :points, :float, default: 0, null: false
      t.change :unknown_level, :integer, default: 0, null: false
      t.change :fact_points, :float, default: 0, null: false
      t.change :hours_count, :float, default: 0, null: false
      t.change :status, :string, default: "Планируемый", null: false
      t.change :date_begin, :datetime, default: '2013-01-01 00:00:00', null: false
      t.change :date_end, :datetime, default: '2013-01-01 00:00:00', null: false      
    end
  end

  def down
    change_table :sprints do |t|
      t.change :name, :string
      t.change :points, :float
      t.change :unknown_level, :integer
      t.change :fact_points, :float
      t.change :hours_count, :float
      t.change :status, :string
      t.change :date_begin, :datetime
      t.change :date_end, :datetime
    end
  end
end
