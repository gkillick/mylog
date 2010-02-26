class LogEntriesController < ApplicationController
  def new
    @athlete = current_user
    @log_entry = @athlete.log_entries.build
  end
  def create
    @athlete = current_user
    @log_entry = @athlete.log_entries.build(params[:log_entry])
    if @log_entry.save
      redirect_to sports_path
    else
      render :action=>"new"
    end
  end
end
