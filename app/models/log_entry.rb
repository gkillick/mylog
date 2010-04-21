class LogEntry < ActiveRecord::Base
  has_many :workouts
  belongs_to :athlete
  named_scope :recent, :order => "date DESC", :limit => 3
  accepts_nested_attributes_for :workouts, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes['duration'].blank? || 
      attributes['duration'] == "0:00"
  }
  validates_uniqueness_of :date, :scope => [ :athlete_id ] 

  def date=(something)
    self[:date] = something.to_date
  end

  def self.total_hours_for(date)
    log_entry = first(:conditions => { :date => date.to_date } )
    log_entry.nil? ? 0 : log_entry.total_hours
  end
  
  def self.feel_for(date)
    log_entry = first(:conditions => { :date => date.to_date } )
    log_entry.nil? ? 0 : log_entry.feel
  end
  
  def total_hours
    workouts.collect { |workout| workout.duration_in_minutes }.sum / 60.0
  end
end
