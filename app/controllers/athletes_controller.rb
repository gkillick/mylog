class AthletesController < ApplicationController
  def dashboard 
    @athlete = current_user
    
  end
end
