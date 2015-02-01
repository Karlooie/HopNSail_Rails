class BoatsController < ApplicationController


 def index
 end

 def new
 end

 def create
  @boat = current_user.boats.new permitted_params.boat

  if @boat.save
    redirect_to edit_settings_path, notice: 'Boat saved successfully.'
  else
    render :new
  end

 end

 
end