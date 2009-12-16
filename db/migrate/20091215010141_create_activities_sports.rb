class CreateActivitiesSports < ActiveRecord::Migration
  def self.up
      create_table :activities_sports, :id => false do |t|
        t.integer :activity_id
        t.integer :sport_id
	  end
  end

  def self.down
    drop_table :activities_sports
  end
end
