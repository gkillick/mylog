class LogEntriesController < ApplicationController
  before_filter :require_athlete

  def new
    @athlete = current_user
    @log_entry = @athlete.log_entries.build
    @log_entry.workouts.build(:time_of_day => "AM")
    @log_entry.workouts.build(:time_of_day => "PM")    
  end

  def create
    @athlete = current_user
    @log_entry = @athlete.log_entries.build(params[:log_entry])
    if @log_entry.save
      redirect_to dashboard_athlete_path(@athlete)
    else
      render :action=>"new"
    end
  end

  def edit
    @athlete = current_user
    @log_entry = @athlete.log_entries.find(params[:id])
  end

  def update
    @athlete = current_user
    @log_entry = @athlete.log_entries.find(params[:id])
    if @log_entry.update_attributes(params[:log_entry])
      redirect_to dashboard_athlete_path(@athlete)
    else
      render :action=>"edit"
    end
  end
  
  def destroy
    @athlete = current_user
    @log_entry = @athlete.log_entries.find(params[:id])
    @log_entry.destroy
    flash[:notice] = "Log entry was deleted!"
    redirect_to dashboard_athlete_path(@athlete)
  end

  def index 
    @athlete = current_user
    @log_entries = @athlete.log_entries.all 
  end
end
