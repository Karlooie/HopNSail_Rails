class RidesController < ApplicationController

  def index
    @rides = Ride.all.order(created_at: :desc)
  end

  def show
    @ride = Ride.find params[:id]
    @submission = current_user.submissions.find_by ride_id: @ride.id if user_signed_in?
  end

  def new
  end

 def create
  @ride = current_user.rides.new permitted_params.ride
  if @ride.save
    redirect_to rides_path, notice: 'Ride saved successfully.'
  else
    render :new
  end
 end


end