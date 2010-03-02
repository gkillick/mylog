class AthletesController < ApplicationController
  def dashboard 
    @athlete = current_user
    
  end
  def list
    @athlete = current_user
  end
end
