# coding: utf-8
class CreateSprintStats < ActiveRecord::Migration
  def change
    create_table :sprint_stats do |t|
      t.float :velocity, default: 0, null: false      
      t.float :points, default: 0, null: false

      t.timestamps
    end
  end
end
