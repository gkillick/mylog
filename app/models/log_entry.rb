class LogEntry < ActiveRecord::Base
  belongs_to :athlete
  named_scope :recent, :order => "date DESC", :limit => 3
end
