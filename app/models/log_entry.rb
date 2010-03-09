class LogEntry < ActiveRecord::Base
  has_many :workouts
  belongs_to :athlete
  named_scope :recent, :order => "date DESC", :limit => 3
end
