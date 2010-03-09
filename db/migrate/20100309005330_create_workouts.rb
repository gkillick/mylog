class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.integer :duration
      t.string :time_of_day
      t.references :activity
      t.references :log_entry

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end
