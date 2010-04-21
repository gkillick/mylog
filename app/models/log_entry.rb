class LogEntry < ActiveRecord::Base
  has_many :workouts
  belongs_to :athlete
  named_scope :recent, :order => "date DESC", :limit => 3
  accepts_nested_attributes_for :workouts, :allow_destroy => true,
                                           :reject_if => proc { |attributes| attributes['duration'].blank? || 
                                                                             attributes['duration'] == "0:00"
                                            }

end
