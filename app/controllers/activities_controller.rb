class ActivitiesController < ApplicationController
  def index
  @activities = Activity.all
  end
  def new
   @activity = Activity.new
  end
def create
   @activity = Activity.new(params[:activity])
   if @activity.save
        redirect_to activities_path
   else
        render :action => "new"
   end
end
def edit
  @activity = Activity.find(params[:id])
end
  def update 
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(params[:activity])
	  redirect_to activities_path
	else
	  render :action => "edit"
	end
	
  end
def destroy
  @activity = Activity.find(params[:id])
  @activity.destroy
  redirect_to activities_path
end
end