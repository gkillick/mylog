class Workout < ActiveRecord::Base
  belongs_to :log_entry
  validates_numericality_of :duration
  validates_presence_of :duration, :time_of_day, :activity_id

  def duration=(something)
    if something =~ /\A\d{1,2}:\d{2,2}\z/
      hours, minutes = something.split(":") 
      self[:duration] = hours.to_i * 60 + minutes.to_i
    else
      self[:duration] = something.to_i * 60
    end
  end
  
  def duration
    time = self[:duration] || 0
    "%d:%.2d" % [time / 60, time % 60]
  end
end
