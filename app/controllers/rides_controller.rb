class RidesController < ApplicationController


  def index
    @rides = Ride.all
  end


  def new
  end

 def create
  binding.pry
  @ride = current_user.rides.new permitted_params.ride

  if @ride.save
    redirect_to rides_path, notice: 'Ride saved successfully.'
  else
    render :new
  end

 end





end