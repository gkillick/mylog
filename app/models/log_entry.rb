class LogEntry < ActiveRecord::Base
  has_many :workouts
  belongs_to :athlete
  named_scope :recent, :order => "date DESC", :limit => 3
  accepts_nested_attributes_for :workouts, :reject_if => proc { |attributes| attributes['duration'].blank? }, :allow_destroy => true

end
