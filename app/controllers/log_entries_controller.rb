class LogEntriesController < ApplicationController
  before_filter :require_athlete

  def new
    @athlete = current_user
    @log_entry = @athlete.log_entries.build
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

  def index 
    @athlete = current_user
    @log_entries = @athlete.log_entries.all 
  end
end
