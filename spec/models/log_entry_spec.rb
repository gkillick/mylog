require 'spec_helper'

describe LogEntry do
  it "should not have the same date and the same athlete as another log entry" do
    athlete = Factory(:athlete)
    first_log_entry  = LogEntry.create(:athlete => athlete, :date => Time.now)
    second_log_entry = LogEntry.create(:athlete => athlete, :date => Time.now + 10.seconds)
    second_log_entry.should be_invalid
    second_log_entry.should have(1).error_on(:date)
  end
end
