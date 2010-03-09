class Workout < ActiveRecord::Base
  belongs_to :log_entry
  validates_numericality_of :duration
  validates_presence_of :duration, :time_of_day, :activity_id
end
