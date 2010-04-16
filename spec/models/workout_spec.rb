require 'spec_helper'

describe Workout do
  before(:each) do
    @valid_attributes = {
      :duration => 3,
      :activity_id => 1,
      :time_of_day => "AM"
    }
  end

  it "should create a new instance given valid attributes" do
    Workout.create!(@valid_attributes)
  end


  it "should convert durations in HH:MM format to minutes and store it like that to the database" do
    w = Workout.create(@valid_attributes)
    w.duration = "2:30"
    w[:duration].should == 150
  end

  it "should assume that durations consisting of a single number are hours" do
    w = Workout.create(@valid_attributes)
    w.duration = "2"
    w[:duration].should == 120
  end

  it "should convert durations stored in the database back to HH:MM format" do
    w = Workout.create(@valid_attributes)
    w[:duration] = 150
    w.duration == "2:30"
  end

  it "should return 0 as a duration for an empty workout" do
    w = Workout.new
    w.duration.should == "0:00"
  end
end
