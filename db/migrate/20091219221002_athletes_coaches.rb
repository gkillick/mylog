class AthletesCoaches < ActiveRecord::Migration
  def self.up
    create_table :athletes_coaches, :id => false do |t|
      t.integer :athlete_id
      t.integer :coach_id
    end
  end

  def self.down
    drop_table :athletes_coaches
  end
end
