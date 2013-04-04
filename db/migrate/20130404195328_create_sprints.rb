class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name
      t.float :points
      t.integer :unknown_level
      t.float :fact_points
      t.float :hours_count
      t.string :status
      t.datetime :date_begin
      t.datetime :date_end

      t.timestamps
    end
  end
end
